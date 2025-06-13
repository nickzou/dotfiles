return {
    "rcarriga/nvim-notify",
    commit = "fbef5d32be8466dd76544a257d3f3dce20082a07",
    config = function()
        require("notify").setup({
          -- Only changing the position to bottom
          top_down = false,
          background_colour = "#000000"
        })
        -- Set as default notification function
        vim.notify = require("notify")
    end,
}
