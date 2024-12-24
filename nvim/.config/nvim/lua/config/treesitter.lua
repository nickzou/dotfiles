return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
		"blade",
                "php",
                "html",
            },
            highlight = {
                enable = true,
            },
	    indent = {
		enable = true,
	    }
        }
    end
}
