-- Filetype detection for WordPress block markup. The parser and queries are
-- registered in treesitter.lua (same pattern as blade).
return {
	"nickzou/tree-sitter-wp-blocks",
	lazy = false,
	config = function()
		vim.filetype.add({
			extension = { wpblock = "wpblocks" },
			pattern = {
				[".*/templates/.*%.html"] = "wpblocks",
				[".*/parts/.*%.html"] = "wpblocks",
				[".*/patterns/.*%.html"] = "wpblocks",
				[".*%.html"] = {
					function(_, bufnr)
						for _, line in ipairs(vim.api.nvim_buf_get_lines(bufnr, 0, 10, false)) do
							if line:find("<!%-%-%s*wp:") then
								return "wpblocks"
							end
						end
					end,
					{ priority = -math.huge },
				},
			},
		})

		pcall(vim.treesitter.language.register, "wp_blocks", "wpblocks")
	end,
}
