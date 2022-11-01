local M = {}


local keymap = vim.api.nvim_set_keymap
local autocmd = vim.api.nvim_create_autocmd
--local opts = {noremap = true}
local expr_opts = {expr = true, noremap=true}


function M.setMovementsInLatex()
  keymap("n", "j", "v:count ? 'j' : 'gj'", expr_opts )
  keymap("n", "k", "v:count ? 'k' : 'gk'", expr_opts )
  keymap("v", "j", "v:count ? 'j' : 'gj'", expr_opts )
  keymap("v", "k", "v:count ? 'k' : 'gk'", expr_opts )

  -- also set this variable, as this function is active from the moment we enter a *.tex buffer
  autocmd({"BufWrite", "BufEnter"}, { pattern = {"*.tex"}, command = [[ let g:quickfix_is_open = 1 ]]})
end


function M.QuickfixToggle()
    if vim.g.quickfix_is_open == 1 then
        vim.cmd[[ cclose ]]
        vim.g.quickfix_is_open = 0
    else
        vim.cmd[[ copen ]]
        vim.g.quickfix_is_open = 1
    end
end

return M
