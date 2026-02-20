return {
	cmd = { "vscode-json-language-sercer", "--stdio" },
	filetypes = { "json", "jsonc" },
	settings = {
		json = {
			validate = { enable = true },
		},
	},
}
