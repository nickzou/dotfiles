return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main", -- rewrite branch; required for Neovim 0.12+
    lazy = false,    -- the main branch does not support lazy-loading
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag", -- Auto close and rename HTML/JSX tags
      "JoosepAlviste/nvim-ts-context-commentstring", -- Context-aware commenting
      "nvim-treesitter/nvim-treesitter-context", -- Show code context
      "EmranMR/tree-sitter-blade", -- Blade grammar (best-effort; vim-blade is the fallback)
    },
    config = function()
        local ts = require("nvim-treesitter")

        -- The main branch has no ensure_installed / auto_install / highlight / indent
        -- modules -- installs are explicit and highlighting is Neovim core's job.
        -- NOTE: markdown_inline is required for markdown injections; its absence is
        -- what surfaced the treesitter range() errors that started this migration.
        -- NOTE: on the main branch `jsonc` and `tmux` are not in the parser registry
        -- (jsonc is covered by `json`; tmux has no official parser) -- listing them
        -- triggers "skipping unsupported language" warnings at startup.
        local ensure = {
            "bash", "css", "hcl", "html", "hyprlang", "javascript", "json",
            "lua", "markdown", "markdown_inline", "nix", "php", "rust",
            "terraform", "tsx", "twig", "typescript", "vim", "vimdoc",
        }
        pcall(ts.install, ensure)

        -- Blade is a third-party grammar (not in the official list). Register it by
        -- mutating the parsers table, then install. parser.c + scanner.c are committed
        -- upstream, so this compiles with a C compiler -- no tree-sitter CLI needed.
        -- Everything blade-related is pcall-guarded so it can never break the rest of
        -- the config; if it fails, blade files fall back to jwalton512/vim-blade.
        pcall(function()
            require("nvim-treesitter.parsers").blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = { "src/parser.c", "src/scanner.c" },
                    branch = "main",
                    generate = false,
                },
                tier = 3,
            }
            pcall(ts.install, { "blade" })

            -- blade ships its queries at queries/*.scm (not the queries/blade/ layout
            -- Neovim's runtime expects), so register them by hand.
            local dir = vim.fn.stdpath("data") .. "/lazy/tree-sitter-blade/queries"
            for _, q in ipairs({ "highlights", "injections" }) do
                local fd = io.open(dir .. "/" .. q .. ".scm", "r")
                if fd then
                    pcall(vim.treesitter.query.set, "blade", q, fd:read("*a"))
                    fd:close()
                end
            end
        end)

        -- Start highlighting per buffer (main branch delegates this to Neovim core).
        -- pcall so filetypes without a parser don't raise.
        vim.api.nvim_create_autocmd("FileType", {
            group = vim.api.nvim_create_augroup("nvim_treesitter_start", { clear = true }),
            callback = function(args)
                if pcall(vim.treesitter.start, args.buf) then
                    -- TS indentation is experimental on the main branch; this preserves
                    -- the old `indent = { enable = true }`. Remove if indenting misbehaves.
                    vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end,
        })
    end,
}
