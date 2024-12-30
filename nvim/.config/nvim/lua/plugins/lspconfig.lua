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
	require('lspconfig').intelephense.setup{
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
        "zlib"
      },
      files = {
        maxSize = 5000000;
      };
    };
  };
}
    end
}
