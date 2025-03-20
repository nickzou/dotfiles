vim.g.mapleader = " "
vim.keymap.set('n', '-', '<CMD>Oil<CR>',{ desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>rn', ':set relativenumber!<CR>')
vim.keymap.set({'n','v'}, '<Esc><Esc>', ':noh<CR>', { silent = true })
vim.keymap.set('n', '<leader>t', ':Neotree toggle reveal <CR>')
vim.keymap.set('n', '<leader>gsd<CR>', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>gss<CR>', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>gs', ':Git status<CR>')
vim.keymap.set('n', '<leader>ga', ':Git add %<CR>')
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>hp', 'a<?php  ?><Left><Left><Left>', { noremap = true })
vim.keymap.set('n', '<leader>hs', 'a<?=  ?><Left><Left><Left>', { noremap = true })
vim.keymap.set('n', '<leader>hP', function()
    local pos = vim.api.nvim_win_get_cursor(0)
    local line = vim.api.nvim_get_current_line()
    local row, col = pos[1], pos[2]
    
    -- Get indentation of current line
    local indent = line:match("^%s*")
    
    -- Insert the PHP tags with an empty line between them
    vim.api.nvim_buf_set_lines(0, row-1, row, false, {
        indent .. "<?php",
        indent,
        indent .. "?>"
    })
    
    -- Position cursor on the empty line
    vim.api.nvim_win_set_cursor(0, {row+1, #indent})
    
    -- Enter insert mode
    vim.cmd('startinsert')
end, { noremap = true })
