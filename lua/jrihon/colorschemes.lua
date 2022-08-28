--[[ ------------------------------------------------------------------
                    TOKIONIGHT CONFIGURATION
  ------------------------------------------------------------------ ]]
  -- TOOOOOOOOOKKKKYOOOOOOOOOO
function SetSchemeTokio()
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_keywords = false
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_transparent = true
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_dark_float = true
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
