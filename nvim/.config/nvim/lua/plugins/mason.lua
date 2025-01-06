return {
	"williamboman/mason.nvim",
	config = function() 
		require("mason").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
				"tailwindcss",
				"intelephense"
				-- Add all your required LSPs here
			},
			automatic_installation = true,
		})
	end
}


