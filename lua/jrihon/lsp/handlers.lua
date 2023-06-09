local M = {}

M.setup = function ()                                   -- this method on the table is called in lsp/init.lua file

  local signs = {
    { name = "DiagnosticsSignError", text = ""},
    { name = "DiagnosticsSignWarn", text = ""},
    { name = "DiagnosticsSignHint", text = ""},
    { name = "DiagnosticsSignInfo", text = ""}, }


  for _, sign in ipairs(signs) do
      vim.fn.sign_define(sign.name, {texthl = sign.name, text = sign.text, numhl = ""})
  end

  -- https://github.com/neovim/neovim/blob/master/runtime/lua/vim/lsp/util.lua
  local config = {
      virtual_text = true, -- enable/disable virtual text
      signs = {
          active = signs
      },
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
          focusable = true,
--          style = 'minimal',
          border = 'rounded', -- none, single, double, rounded, solid, shadow
          source = 'always',
--          header = "",
--          prefix = "",
      },
  }
  vim.diagnostic.config(config)

end

local function lsp_keymaps()
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap("n", "gD", ":lua vim.diagnostic.open_float()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gS", ":lua vim.lsp.buf.signature_help()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gH", ":lua vim.lsp.buf.hover()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gl", ":Telescope lsp_declarations<CR>", opts)
  vim.api.nvim_set_keymap("n", "gI", ":Telescope lsp_implementations<CR>", opts)
  vim.api.nvim_set_keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
  vim.api.nvim_set_keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gF", ":lua vim.lsp.buf.format()<CR>", opts)
  vim.api.nvim_set_keymap("n", "gc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-a>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-f>", "<cmd>Format<cr>", opts)
  -- vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<M-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end


M.on_attach = function ()
  lsp_keymaps()
end

-- Add additional capabilities supported by nvim-cmp
-- LOAD CAPABILITIES AS A FINAL STEP
local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return M
