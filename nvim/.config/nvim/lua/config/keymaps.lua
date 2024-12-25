vim.g.mapleader = " "
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>rn', ':set relativenumber!<CR>')
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>tt', ':NvimTreeFocus<CR>')
vim.keymap.set('n', '<leader>gsd', ':Gitsigns reset_hunk<CR>')
