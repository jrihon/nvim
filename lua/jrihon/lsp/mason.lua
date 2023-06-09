-- check if lsp installer works
--local lspinstaller_status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
--if not lspinstaller_status_ok then
--  return
--end

--check if lsp installer works
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end


-- I AM TRYING TO GET THE LUA LS SETTINGS WORKED INTO THE MASON-LSPCONFIG, BUT SO FAR NO LUCK
--
--
--
--
--
--local mason_lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
--if not mason_lsp_status_ok then
--  return
--end

-- Include the servers you want to have installed by default below
--local servers = { "pyright",
--                  "texlab",
--                  "lua_ls",
--                  "vimls",
--                  "rust_analyzer", }


-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
--mason_lsp.setup_handlers {
--  opts = {
--    capabilities = require("jrihon.lsp.handlers").capabilities -- READ IN CAPABILITIES
--  },
--  ["lua_ls"] = function ()
--    local lua_opts = require("jrihon.lsp.settings.lua_ls")
--    opts = vim.tbl_deep_extend("force", lua_opts, opts)
--  end,
--  ["pyright"] = function ()
--      local py_opts = require("jrihon.lsp.settings.pyright")
--      opts = vim.tbl_deep_extend("force", py_opts, opts)
--  end,
--
--    if server.name == "pyright" then
--      local py_opts = require("jrihon.lsp.settings.pyright")
--      opts = vim.tbl_deep_extend("force", py_opts, opts)
--    end
--
--  -- This setup() function will take the provided server configuration and decorate it with the necessary properties
--  -- before passing it onwards to lspconfig.
--  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--  server:setup(opts)
--end)
--}

-- Check if a server is called but not installed
--for _, name in pairs(servers) do
--  local server_is_found, server = mason.get_server(name)
--  if server_is_found and not server:is_installed() then
--    print("Installing " .. name)
--    server:install()
--  end
--end

-- Settings to customize the installation settings
mason.setup({
  automatic_installation = true, -- automatically install newly detected version
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    }
  }
})

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- EDIT : This is handled by lsp_installer table below
--for _, lsp in pairs(servers) do
--  lspconfig[lsp].setup{}
--      -- on_attach = my_custom_on_attach,
--      capabilities = capabilities,
--    }
--end
