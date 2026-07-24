return {
    "folke/zen-mode.nvim",
    cmd = "ZenMode", -- load only when :ZenMode is first called
    opts = {
        window = {
            width = 90, -- columns of the centered content area
        },
        plugins = {
            twilight = { enabled = true }, -- dim inactive code via your existing twilight.nvim
        },
        -- Bundle Pencil into Zen: soft-wrap prose on enter, turn it off on exit.
        on_open = function()
            vim.cmd("SoftPencil")
        end,
        on_close = function()
            vim.cmd("NoPencil")
        end,
    },
}
