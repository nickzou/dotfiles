  return {
    'R1PeR/bounce.nvim',
    config = function()
      require('bounce').setup {
        delay_time = 1000,
        highlight_group_name = '@text.todo',
        more_jumps = false,
        display_mode = "virtual_line",
      }
    end,
  }
