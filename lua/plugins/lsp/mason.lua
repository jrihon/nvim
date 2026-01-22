--[[
The language server configurations can be found here : 
https://www.github.com/neovim/nvim-lspconfig/blob/master/lsp/
--]]
-- customised settings can be added in `after/lsp/*.lua`
-- name has to match that of the default configured lsp

-- from community-maintained nvim-lspconfig

local mason_opts = {
  automatic_installation = true, -- automatically install newly detected version
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  }
}

-- These become readily available, so we don't have to 
-- manually call them with vim.lsp.enable() anymore
local mason_ensure_installed = {
    "lua_ls",       -- lua
    "pyright",      -- python
--    "ty",           -- python
    "marksman",     -- markdown
    "vtsls",        -- typescript, javascript
    "yamlls",       -- yaml
    "terraformls", -- terraform
    "cssls",        -- css
}

return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
      ensure_installed = mason_ensure_installed
  },
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = mason_opts
    },
    "neovim/nvim-lspconfig"
  },
}
