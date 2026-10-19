<h1 align="center">dotfiles</h1>

<p align="center">
  My terminal-first setup for <b>macOS</b> and <b>Linux</b>:<br>
  Neovim · Alacritty · tmux · zsh · AeroSpace / yabai / skhd
</p>

<p align="center">
  <img alt="neovim" src="https://img.shields.io/badge/neovim-0.12%2B-57A143?logo=neovim&logoColor=white">
  <img alt="platform" src="https://img.shields.io/badge/platform-macOS%20%7C%20Linux-lightgrey">
  <img alt="shell" src="https://img.shields.io/badge/shell-zsh-89e051?logo=gnubash&logoColor=white">
</p>

---

## Quick start

```bash
git clone git@github.com:furkanbiten/dotfiles.git
cd dotfiles
./setup.sh
```

The script is **idempotent**: run it again whenever you want to update. It installs only what is missing or outdated, and **backs up** any config it replaces to `<file>.bak-<timestamp>`.

| Step | macOS | Linux (apt, x86_64 / arm64) |
|------|-------|-----------------------------|
| System packages | Homebrew: `neovim go lazygit ripgrep fd tmux tree-sitter-cli …` | `apt`: `build-essential zsh tmux xclip ripgrep fd-find ncurses-term …` |
| Terminal + font | `alacritty`, `font-hack-nerd-font` (casks) | install a [Nerd Font](https://www.nerdfonts.com) yourself |
| Node | nvm (latest release) | nvm (latest release) |
| Neovim | `brew` | latest release tarball (**sha256-verified**) → `~/.local/nvim`, linked into `~/.local/bin` |
| Go | `brew` | latest release (**sha256-verified**) → `~/go-sdk`, replaced when outdated |
| tree-sitter CLI | `brew` | `npm install -g tree-sitter-cli` |
| Go tools | `efm-langserver` | `efm-langserver`, `lazygit` |
| Configs | nvim, alacritty, tmux (+ tpm), `.zprofile`, Karabiner | nvim, alacritty, tmux (+ tpm) |
| `~/.zshrc` | seeded from `.zshrc` only if you have none | same |
| Plugins | `:Lazy restore` to the commits in `lazy-lock.json` | same |
| Shell | oh-my-zsh + powerlevel10k (your `~/.zshrc` is never overwritten) | same |

## What's inside

```
dotfiles/
├── setup.sh                  # one-shot installer (macOS + Linux)
├── .zshrc  .zprofile         # zsh: oh-my-zsh + powerlevel10k; brew, nvm, cargo (macOS)
├── .tmux.conf                # tmux, vi keys, nvim-aware pane navigation
├── .aerospace.toml           # AeroSpace tiling WM (macOS)
├── .yabairc  .skhdrc         # yabai + skhd alternative (macOS)
├── .vscode/                  # VS Code settings + keybindings
└── .config/
    ├── alacritty.toml        # terminal: colors, Hack Nerd Font, key bindings
    ├── karabiner/            # Karabiner-Elements rules (macOS)
    ├── nvim/                 # Neovim (lazy.nvim, LSP, telescope, …)
    └── vscode_nvim/          # Vim config used by the VS Code Neovim extension
```

## Neovim

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim), which bootstraps itself on first launch. `lazy-lock.json` pins every plugin, so a fresh machine gets exactly the versions I use.

- **LSP** via mason: `lua_ls`, `rust_analyzer`, `basedpyright`, `ruff`, `clangd`, `marksman`
- **Treesitter** (`main` branch API; needs the `tree-sitter` CLI), **telescope**, **trouble**, **aerial**, **oil**, **gitsigns**, **fugitive**, **noice**, **lualine**
- Debugging with `nvim-dap` through `mason-nvim-dap`

Update plugins and re-pin them:

```bash
nvim --headless "+Lazy! sync" +qa
cp ~/.config/nvim/lazy-lock.json ~/dotfiles/.config/nvim/   # then commit
```

Check that everything is healthy with `:checkhealth`.

## Alacritty

Alacritty reads `~/.config/alacritty/alacritty.toml` first, so `setup.sh` installs the config there.

| Key | Action |
|-----|--------|
| `Ctrl+←` / `Ctrl+→` | jump back / forward one word |
| `Shift+Enter` | newline without submitting (sends `ESC` + `CR`) |
| `Alt+h j k l s w` | sent as `ESC`-prefixed keys for tmux / nvim |

> **macOS gotcha:** `Ctrl+←/→` is a Mission Control shortcut ("Move left/right a space") and is swallowed before any app sees it.
> Turn it off in *System Settings → Keyboard → Keyboard Shortcuts → Mission Control*.

## tmux

- Plugins via [tpm](https://github.com/tmux-plugins/tpm): start tmux and press `prefix` + <kbd>I</kbd>
- `Alt+←/→/↑/↓` moves between tmux panes and nvim splits
- Clipboard works on both platforms (`pbcopy`/`pbpaste` on macOS, `xclip` on Linux)
- True color: `tmux-256color` with an `RGB` terminal feature for Alacritty

## Window management (macOS)

`.aerospace.toml` (AeroSpace) and `.yabairc` + `.skhdrc` (yabai + skhd) are two alternatives. Copy the one you use to `~/`.

## Manual steps

- Linux: install a [Nerd Font](https://www.nerdfonts.com) and set it in your terminal (macOS gets Hack Nerd Font from `setup.sh`).
- Run `p10k configure` once to set up the prompt.
- Make zsh your login shell if it isn't: `chsh -s "$(command -v zsh)"`.
