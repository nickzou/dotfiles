return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    require("fzf-lua").setup({
	vim.keymap.set("n", "<space>p", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true }),
	vim.keymap.set("n", "<space>ff", "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true }),
	vim.keymap.set("v", "<space>fg", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { noremap = true, silent = true })
    })
  end
}
