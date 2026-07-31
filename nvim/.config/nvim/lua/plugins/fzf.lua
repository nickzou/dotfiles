return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- calling `setup` is optional for customization
    -- ripgrep preprocessor that transcodes .docx -> plain text so grep can search
    -- their contents (--pre-glob limits it to docx; all other files use rg's fast path).
    local rg_pre = vim.fn.stdpath("config") .. "/scripts/rg-pre.sh"
    require("fzf-lua").setup({
      'telescope',
      grep = {
        rg_opts = "--pre " .. rg_pre .. " --pre-glob '*.docx' "
          .. "--column --line-number --no-heading --color=always --smart-case --hidden -g '!{node_modules,.git,vendor}'"
      },
    })
	vim.keymap.set("n", "<space>p", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<space>f", "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true })
	vim.keymap.set("v", "<space>g", "<cmd>lua require('fzf-lua').grep_visual()<CR>", { noremap = true, silent = true })
	vim.keymap.set("v", "<space>p", "<cmd>lua require('fzf-lua').files({ query = require('fzf-lua.utils').get_visual_selection() })<CR>", { noremap = true, silent = true })
	vim.keymap.set("n", "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
  end
}
