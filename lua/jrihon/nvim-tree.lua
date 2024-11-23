--[[ ------------------------------------------------------------------
                                NVIM-TREE
 ------------------------------------------------------------------ ]]
local nvim_tree_status_ok, nvim_tree = pcall(require, "nvim-tree")
if not nvim_tree_status_ok then
    return
end

local autocmd = vim.api.nvim_create_autocmd

-- Default settings
nvim_tree.setup({})


-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local tree_api = require("nvim-tree.api")






-- On first VimEnter
local function open_nvim_tree(data)

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not no_name and not directory then
    return
  end

  -- change to the directory
  if directory then
    vim.cmd.cd(data.file)
  end

  -- open the tree
  tree_api.tree.open()
end







-- update the root directory of nvim tree whenever you change buffers
local function update_root_dir()

  local dir = vim.fn.expand('%:p:h') -- expand path of current file and basename() the string
  local is_dir = vim.fn.isdirectory(dir) == 1

  if is_dir then
    tree_api.tree.change_root(dir)
  end
end


-- Create auto commands
--autocmd({ "VimEnter" }, { callback = open_nvim_tree })
autocmd({ "BufEnter" }, { callback = update_root_dir })



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





    -- deprecated
    nvim_tree.setup({
      respect_buf_cwd = true,
      open_on_setup = true,
      -- https://stackoverflow.com/questions/71346431/neovim-nvim-tree-doesnt-open-current-directory-only-the-parent-directory-with-g
      update_focused_file = {
                      enable = true,
                      update_cwd = true,
                   },
    })
  ]]
