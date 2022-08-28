--[[ ------------------------------------------------------------------
                        COMFORTABLE MOTION CONFIGURATION
  ------------------------------------------------------------------ ]]
--  https://github.com/yuttie/comfortable-motion.vim ; check for default mappings
--  C-d and C-u are used for going up and down. 
--  C-f is for going a full page up, C-b has been remapped to :Buffers. But generally I don't even use these so it does not matter
--  Comfie motion is acive, but the default settings are in use and that's just fine
--
-- vim.api.nvim_set_keymap("n", "<silent> <C-d>", ":call comfortable_motion#flick(100)<CR>", {noremap = true})
-- vim.api.nvim_set_keymap("n", "<silent> <C-u>", ":call comfortable_motion#flick(-100)<CR>", {noremap = true})
-- This is a very ugly work around, but it would not work as a keymap setting
vim.g.comfortable_motion_no_default_key_mappings = 1
vim.cmd[[nnoremap <silent> <C-d> :call comfortable_motion#flick(100)<CR>]]
vim.cmd[[nnoremap <silent> <C-u> :call comfortable_motion#flick(-100)<CR>]]
