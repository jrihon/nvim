--[[ ------------------------------------------------------------------
                                KEYMAPS
 ------------------------------------------------------------------ ]]

local keymap = vim.api.nvim_set_keymap          -- abbreviate keymap function namespace
local autocmd = vim.api.nvim_create_autocmd     -- abbreviate autocmd function namespace
local opts = {noremap = true}
local expr_opts = {expr = true, noremap=true}
--local silent_opts = {silent = true, noremap=true}

vim.g.mapleader = " "

--[[ -----------------------------
            PLUGIN KEYMAPS
 --------------------------------- ]]

--[[ Telescope remaps ]]
keymap('n', '<C-p>', ':Telescope find_files<CR>', opts )
keymap('n', '<C-q>', ':Telescope buffers<CR>', opts )
keymap('n', '<C-w>', ':Telescope live_grep<CR>', opts )

--[[ Mutineer remaps ]]
keymap('n', '<leader>m', ':Mutineer<CR>', opts)
keymap('v', '<leader>m', ':Mutineer<CR>', opts)


--[[ Nvim-Tree remaps ]]
keymap("n", "<leader>nw", ":NvimTreeOpen<CR>", opts) -- open the filetree in the buffer of the current file


--[[ ToggleTerm remaps ]]
-- Actuate ToggleTerm with the following mapping : [[<C-\>]],

--[[ VimTex mappings ]]
-- keymap(\ll) is to compile the current LaTeX document and open the pdf
-- keymap(\lv) is to open the pdf version of the current LaTeX document (no compilation)

--[[ ComfortableMotion mappings ]]
-- <C-d> has been mapped to a comfortable motion scrolling option
-- <C-u> has been mapped to a comfortable motion scrolling option

--[[ GoTo mappings ]]
-- does not work because the GoTo() function is not imported for some reason
--keymap("n", "<leader>gt", ":lua GoTo()<CR>", opts)

--[[ LSP remaps]]
-- gD :lua vim.diagnostic.open_float()
-- gS :lua vim.lsp.buf.signature_help()
-- gH :lua vim.lsp.buf.hover()
-- gl :Telescope lsp_declarations
-- gI :Telescope lsp_implementations
-- gr :Telescope lsp_references<CR>
-- gd :lua vim.lsp.buf.definition()
-- gF :lua vim.lsp.buf.formatter()




--[[ -----------------------------
            VIM KEYMAPS
 --------------------------------- ]]
--[[ Window or buffer related keymaps ]]
keymap("n", "<leader>h", ":wincmd h<CR>", opts ) -- shift from left window to right window
keymap("n", "<leader>l", ":wincmd l<CR>", opts ) -- shift from right window to left window
keymap("n", "<leader>k", ":wincmd k<CR>", opts ) -- shift from bottom window to top window
keymap("n", "<leader>j", ":wincmd j<CR>", opts ) -- shift from top window to bottom window
keymap("n", "<leader>+", ":vertical resize +15<CR>", opts) -- resize vertical split larger
keymap("n", "<leader>-", ":vertical resize -15<CR>", opts) -- resize vertical split smaller
--keymap("n", "<silent> <Leader>vs", ":vsplit <Bar> :wincmd l <Bar> :Files <CR>", opts) -- uses fzf.vim plugin



--[[ Access specific files on my machine ]]
keymap("n", "<leader>nvim", ":e $HOME/.config/nvim/init.lua<CR>",  opts )
keymap("n", "<leader>tmux", ":e $HOME/.tmux.conf<CR>",  opts )
keymap("n", "<leader>bash", ":e $HOME/.bashrc<CR>",  opts )
keymap("n", "<leader>kitty", ":e $HOME/.config/kitty/kitty.conf<CR>",  opts )
keymap("n", "<leader>so", ":source $HOME/.config/nvim/init.lua<CR>",  opts )

--[[ Avoid having stuff pasting or deleted to your yank register]]
-- when pasting something, in v-mode, use capital P to paste, so the deleted 
-- text is not sent to your registry
--keymap("v", "<leader>p", "\"_dP",  opts )
--keymap("n", "<leader>d", "\"_d",  opts )
--keymap("v", "<leader>d", "\"_d",  opts )


--[[ LaTeX remaps ]]
-- In LaTeX files, set linebreak and wrap text around terminal column limits
autocmd({"BufNewFile", "BufRead"}, { pattern = {"*.tex", "*.typ", "*.txt", "*.md"}, command = [[set wrap]]})
autocmd({"BufNewFile", "BufRead"}, { pattern = {"*.tex", "*.typ", "*.txt", "*.md"}, command = [[set linebreak]]})

-- function to set movement mappings for LaTex (wrapped text)
function SetMovementsInLatex()
  keymap("n", "j", "v:count ? 'j' : 'gj'", expr_opts )
  keymap("n", "k", "v:count ? 'k' : 'gk'", expr_opts )
  keymap("v", "j", "v:count ? 'j' : 'gj'", expr_opts )
  keymap("v", "k", "v:count ? 'k' : 'gk'", expr_opts )
end
autocmd({"BufNewFile", "BufRead"}, { pattern = {"*.tex", "*.typ", "*.txt", "*.md"}, command = [[lua SetMovementsInLatex()]]})


-- Toggle Quickfix list in LaTeX files, necessary whenever I compile a LaTeX document
autocmd({"BufWrite", "BufEnter"}, { pattern = {"*.tex"}, command = [[ let g:quickfix_is_open = 1 ]]})
function QuickfixToggle()
    if vim.g.quickfix_is_open == 1 then
        vim.cmd[[ cclose ]]
        vim.g.quickfix_is_open = 0
    else
        vim.cmd[[ copen ]]
        vim.g.quickfix_is_open = 1
    end
end
keymap("n", "<leader>c", ":lua QuickfixToggle()<CR>", opts )

--[[ Custom keymaps ]]

--local custom_functions = require('jrihon.custom_functions.clipboard')
-- Clip selection from visual mode and copy to clipboard
--local customs = require('custom_functions.copy2clipboard')
--vim.api.nvim_create_user_command("Copy2Clipboard",
--                            function () custom_functions.Copy2clipboard()
--                            end,
--                            { range = true })
--
--keymap("v", "<leader>pp", ':Copy2Clipboard<CR>' , opts)

vim.api.nvim_set_keymap("v", "<leader>pp", ":%w !xclip -selection clipboard<CR><CR> :echo 'Selection clipped!'<CR>", opts )

-- This actually maps the :W to :write !! I do this because I fat finger the :write command to :W often
vim.cmd[[command! -nargs=* W w]]
vim.cmd[[command! -nargs=* Wq wq]]
vim.cmd[[command! -nargs=* Q q]]

-- Make a command to call Rust's cargo system from the command mode
vim.cmd[[command! -nargs=* Cargo !cargo <args>]]



-- *.lib files are recognised as cobol. Set syntax off when entering a cobol file
function FuckCobol()
    if vim.bo.filetype == 'cobol' then vim.cmd[[ syntax off ]] end
end
autocmd({"BufEnter"}, { pattern = {"*.lib"}, command = [[ :lua FuckCobol() ]]})
