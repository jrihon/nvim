--[[ ------------------------------------------------------------------
                                    ORCA.VIM
 ------------------------------------------------------------------ ]]
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, { pattern = {"*.inp"}, command = [[ set filetype=orca ]]})
