-- Status call to see if Telescope is available for calls
local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
    return
end
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}

-- Telescope remaps
keymap('n', '<C-p>', ':Telescope find_files<CR>', opts )
keymap('n', '<C-b>', ':Telescope buffers<CR>', opts )
keymap('n', '<C-w>', ':Telescope live_grep<CR>', opts )


-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
local actions = require("telescope.actions")
telescope.setup({
  defaults = {
    initial_mode = "normal",        -- the initial mode I want to start in is normal mode, because I probably switch buffers more often
    i = { ["<CR>"] = actions.select_default, }
  },
})





-- install the following "$ sudo apt install silversearcher-ag"
if vim.fn.executable('ag') == 0 then
    print("install silversearcher-ag through :\n$ sudo apt install silversearcher-ag")
end

-- install the following "$ sudo apt install silversearcher-ag"
if vim.fn.executable('rg') == 0 then
    print("install RipGrep through :\n$ sudo apt install ripgrep")
end



--[[
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "bottom" or "top,
    prompt_prefix = ">" "any string will do,
    initial_mode = "insert" or "normal",
    selection_strategy = "reset",
    sorting_strategy = "descending" or "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      -- TODO add builtin options.
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0 "or any number,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default { }, currently unsupported for shells like cmd.exe / powershell.exe
    file_previewer = require'telescope.previewers'.cat.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_cat.new`
    grep_previewer = require'telescope.previewers'.vimgrep.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_vimgrep.new`
    qflist_previewer = require'telescope.previewers'.qflist.new, -- For buffer previewer use `require'telescope.previewers'.vim_buffer_qflist.new`

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
--]]
