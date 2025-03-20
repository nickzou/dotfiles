return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag", -- Auto close and rename HTML/JSX tags
      "JoosepAlviste/nvim-ts-context-commentstring", -- Context-aware commenting
      "nvim-treesitter/nvim-treesitter-context", -- Show code context
    },
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "blade",
                "twig",
                "php",
                "html",
                "typescript",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            }
        }
    end
}
