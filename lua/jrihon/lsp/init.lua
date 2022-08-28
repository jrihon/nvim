local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

require("jrihon.lsp.lsp_installer")         -- Easy way to install language server protocols
require("jrihon.lsp.handlers").setup()
require("jrihon.lsp.handlers").on_attach()
--require("jrihon.lsp.lsp_signature")   this does not work as well, fix later
