return {
    'stevearc/conform.nvim',
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                javascript = { 'biome', 'prettier', stop_after_first = true },
                typescript = { 'biome', 'prettier', stop_after_first = true },
                css = { 'biome', 'prettier', stop_after_first = true },
                html = { 'prettier' },
                json = { 'biome', 'prettier', stop_after_first = true },
                jsonc = { 'biome', 'prettier', stop_after_first = true },
                yaml = { 'prettier' },
                markdown = { 'prettier' },
		        blade = { 'prettier' },
                go = { 'goimports' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end
}
