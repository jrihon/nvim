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
    capabilities = capabilities,
    settings = require("jrihon.lsp.settings.pyright")
})

--lspconfig["ty"].setup({ -- PYTHON
--    on_attach = on_attach,
--    capabilities = capabilities,
--    settings = require("jrihon.lsp.settings.pyright")
--})
--lspconfig["ruff_lsp"].setup({ -- PYTHON
--    on_attach = on_attach,
--    capabilities = capabilities,
--    init_options = {
--    settings = {
--      -- Any extra CLI arguments for `ruff` go here.
--      args = {},
--    }
--  }
--})

lspconfig["rust_analyzer"].setup({ -- RUST
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig["texlab"].setup({ -- LaTeX
    on_attach = on_attach,
    capabilities = capabilities
})

lspconfig.typst_lsp.setup({ -- Typst
--    on_attach = on_attach,
--    capabilities = capabilities,
    settings = {
		exportPdf = "never" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
	},
})
--lspconfig["vimls"].setup({ -- VIM
--    on_attach = on_attach,
--    capabilities = capabilities
--})

--lspconfig["lua_ls"].setup({ -- LUA
--    on_attach = on_attach,
--    capabilities = capabilities,
--    settings = require("jrihon.lsp.settings.lua_ls")
--})
