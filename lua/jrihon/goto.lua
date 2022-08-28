--[[ ------------------------------------------------------------------
                            GOTO CONFIGURATION
  ------------------------------------------------------------------ ]]
-- whenever the completion engine cannot be found
local goto_status_ok, _ = pcall(require, "goto")
if not goto_status_ok then
    return
end


vim.api.nvim_set_keymap("n", "<leader>gt", ":lua GoTo()<CR>", {noremap = true})
