--return {
--  {
--    "folke/tokyonight.nvim",
--    lazy = false,
--    priority = 1000,
--    opts = {
--      style = "day",
--      transparent = true,
--      terminal_colors = true,
--      styles = {
--        comments = { italic = true},
--        keywords = { italic = false},
--        sidebars = "light", -- style for sidebars, see below
--        floats = "light", -- style for floating windows	    
--        sidebars = "dark", -- style for sidebars, see below
--        floats = "dark", -- style for floating windows	    
--      },
--    },
--    init = function()
--      -- load the colorscheme here
--      vim.cmd([[colorscheme tokyonight]])
--    end,
--  },
--  -- Get color highlight based on text in nvim
--  {
--    "ap/vim-css-color",
--  },
--}
--
return {
    "catppuccin/nvim",
    as = "catppuccin",
    flavour = "latte", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    init = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme catppuccin-nvim]])
    end,
}
