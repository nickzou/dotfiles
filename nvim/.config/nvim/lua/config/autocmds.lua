-- NOTE: Neovim's built-in zip plugin also claims *.docx (Office files are zip
-- archives) and routes it through zip#Browse, which errors here (no `unzip`) and
-- collides with the handler below. It's disabled via lazy's disabled_plugins in
-- config/lazy.lua -- it must be turned off before lazy.setup(), so it can't live here.

-- Terraform template files (templatefile()) have no dedicated parser; treat them
-- as terraform so interpolations (${...}, %{...}) get highlighted.
vim.filetype.add({ extension = { tftpl = "terraform" } })

-- Open .docx files as a read-only markdown view (converted via pandoc).
vim.api.nvim_create_autocmd({ "BufReadCmd" }, {
  pattern = "*.docx",
  callback = function(args)
    vim.bo.filetype = "markdown"
    vim.bo.buftype = "nofile" -- it's a converted view, not the real file
    local md = vim.fn.system({ "pandoc", args.file, "-t", "markdown" })
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(md, "\n"))
  end,
})
