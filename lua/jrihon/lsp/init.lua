local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

require("jrihon.lsp.mason")                                     -- Easy way to install language server protocols
require("jrihon.lsp.handlers").setup()                          -- Only handles diagnostics for now
local on_attach = require("jrihon.lsp.handlers").on_attach()    -- Handles the language server keybinds
local capabilities = require("jrihon.lsp.handlers").capabilities
--require("jrihon.lsp.lsp_signature")   this does not work as well, fix later


lspconfig["pyright"].setup({ -- PYTHON
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig["rust_analyzer"].setup({ -- RUST
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig["texlab"].setup({ -- LaTeX
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig["texlab"].setup({ -- VIM
    on_attach = on_attach,
    capabilities = capabilities
})
