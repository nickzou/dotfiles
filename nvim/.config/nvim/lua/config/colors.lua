-- colors.lua - Custom highlight for Flash.nvim match

-- Create an autocommand group for our highlight override
local highlight_group = vim.api.nvim_create_augroup("CustomHighlights", { clear = true })

-- Set up highlight that persists across colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  group = highlight_group,
  callback = function()
    -- Only customize FlashMatch
    vim.api.nvim_set_hl(0, "FlashLabel", {
      fg = "#bf0606",
      bg = "#bfbbbb",
      bold = true
    })
  end,
})

-- Trigger the highlight immediately upon loading this file
vim.cmd("colorscheme " .. vim.g.colors_name)

return {}
