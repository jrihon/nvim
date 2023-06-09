--[[ ------------------------------------------------------------------
                            PLUGINS VIA PACKER
 ------------------------------------------------------------------ ]]

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print("Installing packer close and reopen Neovim...")
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end ]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  -- snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}


--[[ Install your plugins here ]]
return packer.startup(function(use)
  -- Plugin Mangager
  use "wbthomason/packer.nvim"                          -- Have packer manage itself



  -- LSP specific plugins :  LSP, Completion, snippets and TreeSitter
  use 'neovim/nvim-lspconfig'                            -- Neovim Language Server Protocol
  use 'hrsh7th/nvim-cmp'                                 -- Baseline completion engine
  use 'hrsh7th/cmp-nvim-lsp'                             -- Completion for the LSP engine
  use 'hrsh7th/cmp-buffer'                               -- Completion for the buffer
  use 'hrsh7th/cmp-path'                                 -- Completion for the path
  use 'hrsh7th/cmp-cmdline'                              -- Completion for commandline in nvim
  use 'hrsh7th/cmp-nvim-lua'                             -- Completion for the LSP engine for neovim
  use 'L3MON4D3/LuaSnip'                                 -- Snippets engine, just to tab complete blocks of boilerplate code of text
  use 'rafamadriz/friendly-snippets'                     -- a bunch of snippets to use
--  use 'williamboman/nvim-lsp-installer'                  -- Bootstraps all of the LSP for you with doing much
  use 'williamboman/mason.nvim'                          -- new LSP installer tool
  use 'williamboman/mason-lspconfig.nvim'                -- to be used with the mason plugin
  --use 'ray-x/lsp_signature.nvim'                         -- Function signatures while writing code
  --    use {                                            -- Syntax Highlighter
  --        'nvim-treesitter/nvim-treesitter',
  --        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  --    }



  -- Vim practicals during editing
  use {                                                  -- Telescope, fuzzy finding words in directories and files
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} } }
  use 'nvim-tree/nvim-web-devicons'                      -- Dev Icons
  use {                                                  -- File tree plugin and web dev icons
      'nvim-tree/nvim-tree.lua',
      requires = {'nvim-tree/nvim-web-devicons'} }
  use 'akinsho/toggleterm.nvim'                          -- Toggle a floating terminal
  use 'tpope/vim-fugitive'                               -- Git plugin, to flow better with vim
  use 'lervag/vimtex'                                    -- Plugin to use latex in neovim
  use 'windwp/nvim-autopairs'                            -- automatically add pairs
--  use 'tmsvg/pear-tree'                                  -- autcomplete pairs of brackets, quotes ...
  use 'yuttie/comfortable-motion.vim'                    -- Plugin to make scrolling smoother.
  use 'jrihon/goto.nvim'                                 -- Easier navigation through nvim's init.lua system
  use 'jrihon/mutineer.lua'                               -- Smooth commenting and uncommenting



  -- Status lines and buffer bars
  use {
      'nvim-lualine/lualine.nvim',                      -- Lua-configured status line
       requires = { 'nvim-tree/nvim-web-devicons',
           opt = true } }
  use {
      'akinsho/bufferline.nvim',                        -- Bufferline, to show tabs of active buffers
        requires = 'nvim-tree/nvim-web-devicons',
           tag = "v2.*"}



  -- Colorscheme and highlights
  use 'folke/tokyonight.nvim'                            -- TOKIIOOOOOOOOOOOOO
  use 'morhetz/gruvbox'                                  -- the best colorscheme in the world --ThePrimeagen
  use 'catppuccin/nvim'                                  -- Catppuccin colorscheme, see what the hype is
  use 'mountain-theme/vim'                               -- Dave's recommendation
  use({ 'rose-pine/neovim', as = 'rose-pine', })         -- Rosé Pine colorscheme, see what is up
  use 'EdenEast/nightfox.nvim'                           -- Bashbunni's recommendation
  use({
    "jesseleite/nvim-noirbuddy",
    requires = { "tjdevries/colorbuddy.nvim", branch = "dev" }
    })
  use 'grimme-lab/orca.vim'                              -- syntax detection for orca input filetypes
  use({                                                  -- Markdown preview in browser
      'iamcco/markdown-preview.nvim',
      run = function() vim.fn["mkdp#util#install"]() end,}
      )
  use({'kaarmu/typst.vim', ft = {'typst'}})              -- Typst syntax highlighting




  -- Vim misscelanious
  use 'ap/vim-css-color'                                 -- whenever you use rgba or hexcode in your scripts, this highlights the colourcode as that colour
  use 'junegunn/goyo.vim'                                -- distraction free reading
  --use 'eandrju/cellular-automaton.nvim'                  -- screensaver
  --use({
  --"giusgad/pets.nvim",
  --  requires = {
  --    "edluffy/hologram.nvim",
  --    "MunifTanjim/nui.nvim",
  --  }
  --})
  -- use  'jrihon/uwu.vim'

  -- plugin projects
  -- instead of implicit relative paths
  -- we input the actual path on our machine to have neovim read this
  -- use '/home/jerome/plugins/goto.nvim'                  -- personal project to have neovim read the contents here
  -- use '/home/jerome/plugins/mutineer.lua'               -- personal project to have neovim read the contents here

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)


--[[ GRAVEYARD
   use 'jremmen/vim-ripgrep'                              -- Search for words in files of the cwd, works really well!
   use 'junegunn/fzf'                                     -- FuzzyFinder, works great!
   use 'junegunn/fzf.vim'                                 -- fzf, has to be added
   use 'itchyny/lightline.vim'                            -- Customize the status bar through this plugin
   use 'preservim/nerdtree'                               -- navigate with vim through your filetree
   use 'ryanoasis/nerd-fonts'                             -- nerd fonts
   use 'ryanoasis/vim-devicons'                           -- nerd fonts for vim specifically
   use 'tiagofumo/vim-nerdtree-syntax-highlight'          -- used with devicons but I don't know what for
   use 'vim-utils/vim-man'                                -- View man pages in a vim-buffer. Grep for the man pages.
   use 'jrihon/mutineer.vim'                              -- Makes (un)commenting smoother!
   use 'mbbill/undotree'                                  -- whenever you save something, it goes to the undo directory. Literally never used
   ]]
