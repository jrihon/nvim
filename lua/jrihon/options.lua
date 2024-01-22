--[[ ------------------------------------------------------------------
                                OPTIONS
 ------------------------------------------------------------------ ]]

-- options
local options = {
  hlsearch = false,                                     -- turn off highlights after search is off
  tabstop = 4 ,                                         -- 4 spaces for a tab
  softtabstop = 4,
  shiftwidth = 4,                                       -- 4 spaces for a tab
  expandtab = true,                                     -- expand tabs to spaces
  number= true,                                         -- numbering column
  relativenumber = true,                                -- relative numbering
  smartindent = true,
  wrap = false,                                         -- do not wrap the text in the buffer
  backup = false,
--  undodir = '/home/jerome/.config/nvim/undo_dir',
  undofile = true,
  scrolloff = 6,                                        -- when scrolling, start scrolling from 6 lines off the limit
  incsearch = true,
  laststatus = 2,
  background = 'dark',                                  -- dark mode
  fileencoding = 'utf-8',                               -- utf-8 encoding
  completeopt = {"menu", "menuone", "noselect"},        -- completion (cmp) stuff

}

-- far better readability by iterating over the table and prepending to option
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- general commands
vim.cmd[[filetype indent on]]
vim.cmd[[syntax on]]
vim.cmd[[set guicursor=]] -- disable toggling between thin and block cursor
vim.cmd[[set mouse=]] --disable mouse support

-- global option for setting splits
vim.g.netrw_browse_split = 2
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


-- recognise typst filetype
local create_autocmd = vim.api.nvim_create_autocmd
local events = {"BufNewFile", "BufRead"}
create_autocmd(events, { pattern = {"*.typ"}, command = [[ set filetype=typst ]]})
--create_autocmd(events, { pattern = {"*.typ"}, command = [[ set filetype=typst ]]})
