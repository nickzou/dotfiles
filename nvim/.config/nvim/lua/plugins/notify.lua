return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
          -- Only changing the position to bottom
          top_down = false
        })
        -- Set as default notification function
        vim.notify = require("notify")
    end,
}
