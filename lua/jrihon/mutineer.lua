--[[ ------------------------------------------------------------------
                            MUTINEER CONFIGURATION
  ------------------------------------------------------------------ ]]

local mutineer_status_ok, mutineer = pcall(require,'mutineer')
if not mutineer_status_ok then
    return
end

mutineer.setup({
                -- lineCommentSymbols = {lua = '--'}
})

vim.api.nvim_set_keymap('n', '<leader>m', ':Mutineer<CR>', {noremap = true})
vim.api.nvim_set_keymap('v', '<leader>m', ':Mutineer<CR>', {noremap = true})
