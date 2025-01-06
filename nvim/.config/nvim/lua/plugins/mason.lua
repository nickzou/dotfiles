return {
	"williamboman/mason.nvim",
	config = function() 
		require("mason").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"tsserver",
				-- Add all your required LSPs here
			},
			automatic_installation = true,
		})
	end
}


