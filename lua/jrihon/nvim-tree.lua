--[[ ------------------------------------------------------------------
                                NVIM-TREE
 ------------------------------------------------------------------ ]]
local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
    return
end

-- Set keymaps for filetree
--local autocmd = vim.api.create_autocmd
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}


-- Open the filetree on the bufferpath
--cbd = vim.fn.expand('%:p:h')
--autocmd("BufEnter", {command=[[let g:cBG = expand('%:p:h')]]})
keymap("n", "<leader>nw", ":NvimTreeOpen<CR>", opts) -- open the filetree in the buffer of the current file

-- empty setup using defaults
nvim_tree.setup({
  respect_buf_cwd = true,
  open_on_setup = true,
  -- https://stackoverflow.com/questions/71346431/neovim-nvim-tree-doesnt-open-current-directory-only-the-parent-directory-with-g
  update_focused_file = {
                  enable = true,
                  update_cwd = true,
               },
})


--[[ NVIM TREE COMMANDS
    |:NvimTreeOpen| opens the tree. Takes an optional path argument.
    
    |:NvimTreeClose| closes the tree
    
    |:NvimTreeToggle| open or close the tree. Takes an optional path argument.
    
    |:NvimTreeFocus| open the tree if it is closed, and then focus on the tree
    
    |:NvimTreeRefresh| refresh the tree

    |:NvimTreeCollapse| Collapses the nvim-tree recursively.

    | Inside the file tree, you can do multiple commands : 
        - a : create file
        - r : rename a file 
        - d : delete a file
        - adding `/` at the end of the filepath create a directory instead of a file

    https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt 
  ]]
