return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "cmp-nvim-lsp"
    },
    config = function()
        -- Automatically setup servers installed via Mason
	    local capabilities = require('cmp_nvim_lsp').default_capabilities();
        require("lspconfig").ts_ls.setup({
            -- optional config here
	    capabilities = capabilities,
	    on_attach = function(client, bufnr)
		    print('LSP attached!')
	    end
        })
	require("lspconfig").tailwindcss.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                print('Tailwind LSP attached!')
            end,
            settings = {
                tailwindCSS = {
                    experimental = {
                        classRegex = {
                            'class="([^"]*)"',
                            'className="([^"]*)"',
                        }
                    }
                }
            }
        })
    end
}
