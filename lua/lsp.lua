--[[
The language server configurations can be found here : 
https://www.github.com/neovim/nvim-lspconfig/blob/master/lsp/
--]]
-- customised settings can be added in `after/lsp/*.lua`
-- name has to match that of the default configured lsp

-- from community-maintained nvim-lspconfig
vim.lsp.enable("lua_ls")
vim.lsp.enable("pyright")
