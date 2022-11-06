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
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  light_style = "night",
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

SetSchemeTokio()


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

--SetSchemeGruvBox()


--[[ ------------------------------------------------------------------
                            MOUNTAIN CONFIGURATION
  ------------------------------------------------------------------ ]]
function SetSchemeMountain()
  vim.cmd[[colorscheme mountain]]
end

--SetSchemeMountain()
