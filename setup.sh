#!/usr/bin/env bash
# Dotfiles setup for macOS (Homebrew) and Linux (apt, x86_64/arm64).
# Safe to re-run: installs only what is missing or outdated, backs up configs it replaces.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"
ARCH="$(uname -m)"
STAMP="$(date +%Y%m%d-%H%M%S)"

case "$ARCH" in
    x86_64|amd64)  GH_ARCH="x86_64"; GO_ARCH="amd64" ;;
    arm64|aarch64) GH_ARCH="arm64";  GO_ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH" >&2; exit 1 ;;
esac

have() { command -v "$1" &> /dev/null; }

# Latest GitHub release tag without the API (no rate limit): follows the /releases/latest redirect.
gh_latest_tag() {
    curl -sIL -o /dev/null -w '%{url_effective}' "https://github.com/$1/releases/latest" | sed 's|.*/tag/||'
}

# sha256 of a file (sha256sum on Linux, shasum on macOS).
sha256_of() {
    if have sha256sum; then sha256sum "$1" | awk '{print $1}'; else shasum -a 256 "$1" | awk '{print $1}'; fi
}

# Abort unless file $1 has sha256 $2.
verify_sha256() {
    local actual
    actual="$(sha256_of "$1")"
    if [[ -z "$2" || "$actual" != "$2" ]]; then
        echo "Checksum mismatch for $1: expected '$2', got '$actual'" >&2
        exit 1
    fi
}

# Download a remote install script to a temp file and run it with bash/sh $1 (instead of `curl | sh`).
run_remote_script() {
    local shell="$1" url="$2" tmp
    shift 2
    tmp="$(mktemp)"
    curl -fsSL "$url" -o "$tmp"
    "$shell" "$tmp" "$@"
    rm -f "$tmp"
}

# True (0) if $1 < $2 (dotted versions).
ver_lt() { [[ "$1" != "$2" && "$(printf '%s\n%s\n' "$1" "$2" | sort -V | head -n1)" == "$1" ]]; }

# Append a line to a file only if it is not already there.
add_line() {
    touch "$2"
    grep -qxF "$1" "$2" || echo "$1" >> "$2"
}

# Persist PATH/env lines in the shell rc files that exist (zsh is the default on macOS).
add_to_rc() {
    local rc
    for rc in "$HOME/.zshrc" "$HOME/.bashrc"; do
        if [[ -f "$rc" || "$rc" == "$HOME/.bashrc" && "$OS" == "Linux" ]]; then
            add_line "$1" "$rc"
        fi
    done
}

# Copy file $1 to $2, backing up $2 first if it exists and differs.
install_file() {
    mkdir -p "$(dirname "$2")"
    if [[ -e "$2" ]] && ! cmp -s "$1" "$2"; then
        cp "$2" "$2.bak-$STAMP"
        echo "Backed up $2 -> $2.bak-$STAMP"
    fi
    cp "$1" "$2"
}

# Sync directory $1 into $2, backing up $2 first if it exists and differs.
install_dir() {
    if [[ -d "$2" ]] && ! diff -rq "$1" "$2" &> /dev/null; then
        cp -R "$2" "$2.bak-$STAMP"
        echo "Backed up $2 -> $2.bak-$STAMP"
    fi
    mkdir -p "$2"
    cp -R "$1/." "$2/"
}

export PATH="$HOME/.local/bin:$HOME/go-sdk/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH"
mkdir -p "$HOME/.local/bin" "$HOME/.config"

# ---------------------------------------------------------------- system packages
install_system_packages() {
    if [[ "$OS" == "Darwin" ]]; then
        if ! have brew; then
            echo "Homebrew is required: https://brew.sh" >&2
            exit 1
        fi
        brew update
        # neovim/go/lazygit are managed by brew on macOS; unzip/python3 are needed by mason.nvim
        brew install neovim go lazygit ripgrep fd tmux unzip python3 git curl tree-sitter-cli
        brew install --cask alacritty font-hack-nerd-font || true
    else
        sudo apt-get update
        sudo apt-get install -y curl wget git unzip tar build-essential zsh tmux xclip \
            ripgrep fd-find ncurses-term python3 python3-pip python3-venv
        # Debian/Ubuntu ship fd as "fdfind"
        if have fdfind && ! have fd; then
            ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
        fi
    fi
}

# ---------------------------------------------------------------- node (nvm)
install_node() {
    if have node; then
        echo "Skipping node installation"
        return
    fi
    local nvm_latest
    nvm_latest="$(gh_latest_tag nvm-sh/nvm)"
    run_remote_script bash "https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_latest}/install.sh"
    export NVM_DIR="$HOME/.nvm"
    # nvm.sh is not nounset-safe
    set +u
    # shellcheck disable=SC1091
    . "$NVM_DIR/nvm.sh"
    nvm install node
    set -u
}

# ---------------------------------------------------------------- go (linux only, brew handles macOS)
install_go_linux() {
    local latest current
    latest="$(curl -fsSL 'https://go.dev/VERSION?m=text' | head -n1)"   # e.g. go1.27.2
    current=""
    if [[ -x "$HOME/go-sdk/bin/go" ]]; then
        current="$("$HOME/go-sdk/bin/go" version | awk '{print $3}')"
    fi
    if [[ -n "$current" ]] && ! ver_lt "${current#go}" "${latest#go}"; then
        echo "Go is up to date ($current)"
    else
        echo "Installing ${latest}"
        local tmp
        tmp="$(mktemp -d)"
        curl -fsSL "https://go.dev/dl/${latest}.linux-${GO_ARCH}.tar.gz" -o "$tmp/go.tar.gz"
        local want
        want="$(curl -fsSL 'https://go.dev/dl/?mode=json' | python3 -c "
import json, sys
name = sys.argv[1]
for rel in json.load(sys.stdin):
    for f in rel['files']:
        if f['filename'] == name:
            print(f['sha256'])
            sys.exit()
" "${latest}.linux-${GO_ARCH}.tar.gz")"
        verify_sha256 "$tmp/go.tar.gz" "$want"
        rm -rf "$HOME/go-sdk"      # go must not be extracted over an old tree
        mkdir -p "$HOME/go-sdk"
        tar xzf "$tmp/go.tar.gz" -C "$HOME/go-sdk" --strip-components=1
        rm -rf "$tmp"
    fi
    # shellcheck disable=SC2016  # literal $HOME is intended; expanded by the shell at login
    add_to_rc 'export GOROOT="$HOME/go-sdk"'
    # shellcheck disable=SC2016  # literal $HOME is intended; expanded by the shell at login
    add_to_rc 'export PATH="$HOME/go-sdk/bin:$HOME/go/bin:$PATH"'
}

install_go_tools() {
    if ! have efm-langserver; then
        go install github.com/mattn/efm-langserver@latest
    else
        echo "Skipping efm-langserver installation"
    fi
    # lazygit comes from brew on macOS
    if [[ "$OS" == "Linux" ]] && ! have lazygit; then
        go install github.com/jesseduffield/lazygit@latest
    fi
}

# ---------------------------------------------------------------- neovim (linux only, brew handles macOS)
install_nvim_linux() {
    local latest current=""
    latest="$(gh_latest_tag neovim/neovim)"      # e.g. v0.12.6
    if have nvim; then
        current="$(nvim --version | head -n1 | sed 's/^NVIM v//')"
    fi
    if [[ -n "$current" ]] && ! ver_lt "$current" "${latest#v}"; then
        echo "nvim is up to date ($current)"
        return
    fi
    echo "Installing nvim ${latest} (was: ${current:-none})"
    local tmp
    tmp="$(mktemp -d)"
    local asset="nvim-linux-${GH_ARCH}.tar.gz" want
    curl -fsSL "https://github.com/neovim/neovim/releases/download/${latest}/${asset}" -o "$tmp/nvim.tar.gz"
    # GitHub publishes a sha256 "digest" for every release asset
    want="$(curl -fsSL "https://api.github.com/repos/neovim/neovim/releases/tags/${latest}" | python3 -c "
import json, sys
name = sys.argv[1]
for a in json.load(sys.stdin)['assets']:
    if a['name'] == name:
        print(a['digest'].split(':', 1)[1])
        sys.exit()
" "$asset")"
    verify_sha256 "$tmp/nvim.tar.gz" "$want"
    rm -rf "$HOME/.local/nvim"
    mkdir -p "$HOME/.local/nvim"
    tar xzf "$tmp/nvim.tar.gz" -C "$HOME/.local/nvim" --strip-components=1
    ln -sf "$HOME/.local/nvim/bin/nvim" "$HOME/.local/bin/nvim"
    rm -rf "$tmp"
    # shellcheck disable=SC2016  # literal $HOME is intended; expanded by the shell at login
    add_to_rc 'export PATH="$HOME/.local/bin:$PATH"'
}

# ---------------------------------------------------------------- tree-sitter CLI (linux only, brew handles macOS)
# nvim-treesitter (main branch) compiles parsers with the tree-sitter CLI
install_tree_sitter_linux() {
    if have tree-sitter; then
        echo "Skipping tree-sitter-cli installation"
    else
        npm install -g tree-sitter-cli
    fi
}

# ---------------------------------------------------------------- configs
install_configs() {
    install_dir "$DOTFILES/.config/nvim" "$HOME/.config/nvim"
    # alacritty reads ~/.config/alacritty/alacritty.toml before ~/.config/alacritty.toml
    install_file "$DOTFILES/.config/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
    install_file "$DOTFILES/.tmux.conf" "$HOME/.tmux.conf"
    if [[ "$OS" == "Darwin" ]]; then
        install_file "$DOTFILES/.zprofile" "$HOME/.zprofile"
        install_file "$DOTFILES/.config/karabiner/karabiner.json" "$HOME/.config/karabiner/karabiner.json"
    fi
    # only seed ~/.zshrc if there is none, so an existing one is never touched
    [[ -f "$HOME/.zshrc" ]] || cp "$DOTFILES/.zshrc" "$HOME/.zshrc"

    if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
        git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    else
        echo "Skipping tpm installation"
    fi
}

# Restore plugins to the exact commits pinned in lazy-lock.json (non-interactive).
sync_nvim_plugins() {
    nvim --headless "+Lazy! restore" +qa
}

# ---------------------------------------------------------------- zsh
install_zsh_extras() {
    if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
        # KEEP_ZSHRC: do not overwrite an existing ~/.zshrc; RUNZSH/CHSH: stay in this script
        KEEP_ZSHRC=yes RUNZSH=no CHSH=no run_remote_script sh \
            https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --unattended
    else
        echo "Skipping oh-my-zsh installation"
    fi

    local p10k="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    if [[ ! -d "$p10k" ]]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$p10k"
    else
        echo "Skipping p10k installation"
    fi
}

main() {
    install_system_packages
    install_node
    if [[ "$OS" == "Linux" ]]; then
        install_go_linux
        install_nvim_linux
        install_tree_sitter_linux
    fi
    install_go_tools
    install_configs
    sync_nvim_plugins
    install_zsh_extras
    echo "Done. Open a new shell, then run: tmux, press prefix + I to install tmux plugins."
}

# Allow `source setup.sh` (for testing the helpers) without running the installers.
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
    main "$@"
fi
