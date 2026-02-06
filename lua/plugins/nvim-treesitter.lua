return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  opts = {
    ensure_installed = { 'python', 'typescript' }, --  'bash', 'html',
    auto_install = true,
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      -- additional_vim_regex_highlighting = { 'ruby', 'markdown' },
    },
    -- indent = { enable = true, disable = { 'ruby' } },
  },
  config = function()
        require('nvim-treesitter').install({
            -- 'c', 'go', 'java', 'vim', 'vimdoc',
            'lua',
            'markdown',
            'javascript',
            'typescript', 'python',
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
            -- 'c', 'go', 'java', 'vim', 'vimdoc',
            'lua',
            'markdown',
            'javascript',
            'typescript', 'python',
            },
            callback = function() vim.treesitter.start() end,
        })
  end
}
