local status, lspconfig = pcall(require, "lspconfig")
if not status then return end

-- Downfload from : https://github.com/nextflow-io/language-server/releases

-- Nextflow LSP Configuration
lspconfig.nextflow_ls.setup({
  cmd = { vim.fn.expand("~/.config/nextflow-ls/nextflow-language-server-26.10.1-linux-x64/bin/nextflow-lsp") },
  filetypes = { "nextflow" },
  root_dir = lspconfig.util.root_pattern("nextflow.config", ".git"),
  -- Pass your existing on_attach and capabilities if you use them globally:
  -- on_attach = common_on_attach,
  -- capabilities = common_capabilities,
})

