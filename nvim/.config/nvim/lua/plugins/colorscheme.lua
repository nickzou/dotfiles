return {
  "EdenEast/nightfox.nvim",
  lazy = false, -- make sure this loads during startup
  priority = 1000, -- load this before other plugins
  config = function()
    require("nightfox").setup({
	palettes = {
		carbonfox = {
			sel0="#4b4b4b"
		}
	},
      options = {
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = "italic",
          keywords = "bold",
          types = "italic,bold",
        },
      },
    })
    vim.cmd("colorscheme carbonfox")
  end,
}
