--[[ ------------------------------------------------------------------
                    TOKIONIGHT CONFIGURATION
  ------------------------------------------------------------------ ]]
  -- TOOOOOOOOOKKKKYOOOOOOOOOO
function SetSchemeTokio()

local TOKIO_status_ok, tokyonight = pcall(require, "tokyonight")
if not TOKIO_status_ok then
    return
end

tokyonight.setup({
  -- moon is more pastel, while night is more neon
  style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
--  light_style = "night",
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    comments = { italic = true},
    keywords = { italic = false},
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  }
})

-- Load the colorscheme
vim.cmd[[colorscheme tokyonight]]
end



--[[ ------------------------------------------------------------------
                            GRUVBOX CONFIGURATION
  ------------------------------------------------------------------ ]]
  -- Set your terminal's background to #1D2021,
  -- to get the full gruvbox experience
function SetSchemeGruvBox()
vim.g.gruvbox_italic = 1
vim.g.gruvbox_contrast_dark = 'hard'
vim.g.gruvbox_hls_cursor = 'purple'
vim.g.gruvbox_invert_selection = 0
vim.g.gruvbox_italicize_comments = 1
-- Load the colorscheme
vim.cmd[[colorscheme gruvbox]]
end



--[[ ------------------------------------------------------------------
                            CATPPUCCIN CONFIGURATION
  ------------------------------------------------------------------ ]]
function SetSchemeCatppuccin()

  require("catppuccin").setup({
--    flavour = "macchiato", -- latte, frappe, macchiato, mocha
--    background = { -- :h background
--      light = "latte",
--      dark = "mocha",
--    },
--    transparent_background = true,
--    term_colors = false,
--    dim_inactive = {
--      enabled = false,
--      shade = "dark",
--      percentage = 0.5,
--    },
--    no_italic = false, -- Force no italic
--    no_bold = false, -- Force no bold
--    styles = {
--      comments = { "italic" },
--      conditionals = {},
--      loops = {},
--      functions = {},
--      keywords = {},
--      strings = {},
--      variables = {},
--      numbers = {},
--      booleans = {},
--      properties = {},
--      types = {},
--      operators = {},
--    },
--    color_overrides = {},
--    custom_highlights = {},
--    integrations = {
--      cmp = true,
--      gitsigns = true,
--      nvimtree = true,
--      telescope = true,
--      notify = false,
--      mini = false,
--      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--    },
  })

-- setup must be called before loading
vim.cmd[[colorscheme catppuccin]]
end



--[[ ------------------------------------------------------------------
                            MOUNTAIN CONFIGURATION
  ------------------------------------------------------------------ ]]
function SetSchemeMountain()
  vim.cmd[[colorscheme mountain]]
end




--[[ ------------------------------------------------------------------
                                ROSÉ PINE
  ------------------------------------------------------------------ ]]


function SetSchemeRosePine()
  require('rose-pine').setup({
  	--- @usage 'main' | 'moon'
--  	dark_variant = 'moon',
--  	bold_vert_split = false,
--  	dim_nc_background = false,
--  	disable_background = true,
--  	disable_float_background = false,
--  	disable_italics = false,

  	--- @usage string hex value or named color from rosepinetheme.com/palette
--  	groups = {
--  		background = 'base',
--  		panel = 'surface',
--  		border = 'highlight_med',
--  		comment = 'muted',
--  		link = 'iris',
--  		punctuation = 'subtle',
--
--  		error = 'love',
--  		hint = 'iris',
--  		info = 'foam',
--  		warn = 'gold',
--
--  		headings = {
--  			h1 = 'iris',
--  			h2 = 'foam',
--  			h3 = 'rose',
--  			h4 = 'gold',
--  			h5 = 'pine',
--  			h6 = 'foam',
--  		}
--  		-- or set all headings at once
--  		-- headings = 'subtle'
--  	},
--
--  	-- Change specific vim highlight groups
--  	highlight_groups = {
--  		ColorColumn = { bg = 'rose' }
--  	}
  })

  -- set colorscheme after options
  vim.cmd[[colorscheme rose-pine]]
end


-- Set the configuration of your choice
SetSchemeTokio()
--SetSchemeGruvBox() -- legacy
--SetSchemeCatppuccin()
--SetSchemeMountain() -- very vague hues
--SetSchemeRosePine() -- very vague hues

