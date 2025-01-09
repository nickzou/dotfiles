return {
  "EdenEast/nightfox.nvim",
  lazy = false, -- make sure this loads during startup
  priority = 1000, -- load this before other plugins
  config = function()
    require("nightfox").setup({
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
