--[[ ------------------------------------------------------------------
                                    ORCA.VIM
 ------------------------------------------------------------------ ]]
local create_autocmd = vim.api.nvim_create_autocmd
local events = {"BufNewFile", "BufRead"}
create_autocmd(events, { pattern = {"*.inp"}, command = [[ set filetype=orca ]]})
