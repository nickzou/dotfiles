return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      signs = {
        add          = { text = '+' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
      },
      signs_staged_enable = true,
      linehl = true,
      signcolumn = true,
      show_deleted = false,
      current_line_blame = true,
      word_diff  = true,
    })
  end
}
