return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      linehl = true,
      wordhl = true,
      signcolumn = true,
      show_deleted = true,
      current_line_blame = true,
    })
  end
}
