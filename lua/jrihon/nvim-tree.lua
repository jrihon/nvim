--[[ ------------------------------------------------------------------
                                NVIM-TREE
 ------------------------------------------------------------------ ]]
local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
    return
end

nvim_tree.setup({})
-- empty setup using defaults
--nvim_tree.setup({
--  respect_buf_cwd = true,
--  open_on_setup = true,
--  -- https://stackoverflow.com/questions/71346431/neovim-nvim-tree-doesnt-open-current-directory-only-the-parent-directory-with-g
--  update_focused_file = {
--                  enable = true,
--                  update_cwd = true,
--               },
--})
--local function open_nvim_tree(data)
--
--  -- buffer is a directory
--  local directory = vim.fn.isdirectory(data.file) == 1
--
--  if not directory then
--    return
--  end
--
--  -- change to the directory
--  vim.cmd.cd(data.file)
--
--  -- open the tree
--  require("nvim-tree.api").tree.open()
--end

require("nvim-tree.api").tree.open({
	path = nil,
	current_window = false,
	find_file = false,
	update_root = true,
})


-- Update the root directory upon changing buffers
local function open_nvim_tree()

    local f = vim.fn.expand('%:p:h')
    local file = vim.fn.isdirectory(f) == 1
    if not file then return end

    require("nvim-tree.api").tree.change_root(f)
end

vim.api.nvim_create_autocmd({ "BufEnter" }, { callback = open_nvim_tree })

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
