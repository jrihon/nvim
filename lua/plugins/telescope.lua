local autocmd = vim.api.nvim_create_autocmd


--telescope.setup({
--  defaults = {
--    initial_mode = "normal",        -- the initial mode I want to start in is normal mode, because I probably switch buffers more often
--    i = { ["<CR>"] = actions.select_default, }
--  },
--})


-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
local actions = require("telescope.actions")
-- https://www.reddit.com/r/neovim/comments/14m2y7a/open_telescope_when_starting_neovim_but_only_no/?rdt=61968
autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      require("telescope.builtin").find_files()
    end
  end,
})

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  opts = {
    defaults = {
    -- the initial mode I want to start in is normal mode,
    -- because I probably switch buffers more often
      initial_mode = "normal",
      file_ignore_patterns = {"playgrounds/"},
      i = { ["<CR>"] = actions.select_default, }
    },
  },
}

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
