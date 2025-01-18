vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>rn', ':set relativenumber!<CR>')
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tt', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<leader>gsd<CR>', ':Gitsigns reset_hunk<CR>')
vim.keymap.set('n', '<leader>gss<CR>', ':Gitsigns stage_hunk<CR>')
vim.keymap.set('n', '<leader>gs', ':Git status<CR>')
vim.keymap.set('n', '<leader>ga', ':Git add %<CR>')
vim.keymap.set('n', '<leader>gc', ':Git commit<CR>')
vim.keymap.set('n', '<leader>gp', ':Git push<CR>')
