return {
	lintCommand = "flake8 --max-line-length 120 --ignore W503,W504,E203 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
	lintStdin = true,
	lintIgnoreExitCode = true,
	lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
	lintSource = "flake8",
}
