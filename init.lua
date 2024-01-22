--[[         _                                           _       _ _     _             
            | | ___ _ __ ___  _ __ ___   ___            (_)_ __ (_) |_  | |_   _  __ _ 
         _  | |/ _ \ '__/ _ \| '_ ` _ \ / _ \           | | '_ \| | __| | | | | |/ _` |
        | |_| |  __/ | | (_) | | | | | |  __/           | | | | | | |_ _| | |_| | (_| |
         \___/ \___|_|  \___/|_| |_| |_|\___|           |_|_| |_|_|\__(_)_|\__,_|\__,_| ]]




require("jrihon.plugins")               -- nvim plugins and plugin options using Packer.nvim
require("jrihon.options")               -- nvim basic options
require("jrihon.keymaps")               -- nvim basic and custom keymaps
require("jrihon.vimrooter")             -- find root directory of projects
require("jrihon.telescope")             -- Telescope Fuzzy Finder
require("jrihon.cmp")                   -- Completion engine
require("jrihon.mutineer")              -- jrihon/mutineer.vim best commenting tool
require("jrihon.nvim-tree")             -- Filetree for nvim
require("jrihon.lualine")               -- Status line 
require("jrihon.bufferline")            -- Status bar for files in buffer
require("jrihon.toggleterm")            -- Toggle floating terminal in nvim
require("jrihon.vimtex")                -- VimTex helpful information
require("jrihon.colorschemes")          -- colorschemes
require("jrihon.autopairs")             -- autopair symbols
require("jrihon.comfortable_motion")    -- Comfortable motion for smooth scrolling
require("jrihon.orca")                  -- Orca input files syntax highlighting
require("jrihon.goyo")                  -- Distraction-free reading
require("jrihon.goto")                  -- Easier navigation through nvim's init.lua filesystem
require("jrihon.lsp")                   -- This calls on the directory ~/.config/nvim/lua/jrihon/lsp/
                                        --   nvim will search this directory for an init.lua file
                                        --   and execute all the configuration done in that file.
                                        --   This makes the lspconfig much more tenable to write




--[[ Plugins for later
  https://github.com/folke/trouble.nvim             -- prettify all diagnostics and quickfix list
  https://github.com/lewis6991/impatient.nvim       -- caches nvim for faster startups
  https://github.com/Saecki/crates.nvim             -- plugin to manage crates.io dependencies
  ]]



--[[ LEGACY
require("jrihon.fzf")                   -- Junnegun's amazing FuzzyFinder tool
  ]]
