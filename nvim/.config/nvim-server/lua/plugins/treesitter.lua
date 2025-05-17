return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag", -- Auto close and rename HTML/JSX tags
      "JoosepAlviste/nvim-ts-context-commentstring", -- Context-aware commenting
      "nvim-treesitter/nvim-treesitter-context", -- Show code context
      "EmranMR/tree-sitter-blade",
    },
    config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "blade",
                "twig",
                "php",
                "html",
                "typescript",
                "javascript",
                "tsx",
            },
            sync_install = false,
            auto_install = true,
            modules = {},
            ignore_install = {},
            highlight = {
                enable = true,
            },
            indent = {
                enable = true,
            }
        }
    end
}
