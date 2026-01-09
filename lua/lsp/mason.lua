mason_opts = {
  automatic_installation = true, -- automatically install newly detected version
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  }
}

return {
    "mason-org/mason.nvim",
    opts = mason_opts
}
