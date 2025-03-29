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
        })
    	require("lspconfig").tailwindcss.setup({
           capabilities = capabilities,
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
        require('lspconfig').intelephense.setup{
          filetypes = { "php", "blade", "blade.php" },
          settings = {
            intelephense = {
              stubs = { 
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "Phar",
                "posix",
                "pspell",
                "readline",
                "Reflection",
                "session",
                "shmop",
                "SimpleXML",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                "wordpress",
                "woocommerce",
                "acf-pro",
                "acf-stubs",
                "wordpress-globals",
                "wp-cli",
              },
	        files = {
            associations = { "*.php", "*.blade.php", "*.blade" },
		    maxSize = 5000000;
	      };
	    };
	  };
	}
	require('lspconfig').lua_ls.setup {
	  settings = {
	    Lua = {
	      runtime = {
		-- Tell the language server which version of Lua you're using
		version = 'LuaJIT',
	      },
	      diagnostics = {
		-- Get the language server to recognize the `vim` global
		globals = {'vim'},
	      },
	      workspace = {
		-- Make the server aware of Neovim runtime files
		library = vim.api.nvim_get_runtime_file("", true),
		checkThirdParty = false, -- Disable third party checking
	      },
	      -- Do not send telemetry data
	      telemetry = {
		enable = false,
	      },
	    },
	  },
	}
    end
}
