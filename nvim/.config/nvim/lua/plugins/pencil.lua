return {
    "preservim/vim-pencil",
    -- Loaded on demand by its commands; Zen mode drives it (see zen-mode.lua).
    cmd = { "Pencil", "NoPencil", "PencilToggle", "SoftPencil", "HardPencil" },
    init = function()
        vim.g["pencil#wrapModeDefault"] = "soft" -- "soft" (wrap by window) or "hard" (insert newlines)
        vim.g["pencil#textwidth"] = 74           -- used when wrapMode is "hard"
    end,
}
