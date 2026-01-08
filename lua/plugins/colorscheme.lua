return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { 
      style = "night",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true},
        keywords = { italic = false},
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows	    
      },
    },
    init = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  -- Get color highlight based on text in nvim
  {
    "ap/vim-css-color",
  },
}

