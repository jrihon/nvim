return {
  cmd = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
--        typeCheckingMode = "off", -- handled by ruff_lsp
--        diagnosticMode = "off",-- handled by ruff_lsp
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}
