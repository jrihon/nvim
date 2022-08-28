--[[ ------------------------------------------------------------------
                                KEYMAPS
 ------------------------------------------------------------------ ]]

local keymap = vim.api.nvim_set_keymap          -- abbreviate keymap function namespace
local autocmd = vim.api.nvim_create_autocmd     -- abbreviate autocmd function namespace
local opts = {noremap = true}
local expr_opts = {expr = true, noremap=true}
local silent_opts = {silent = true, noremap=true}

vim.g.mapleader = " "

--[[ -----------------------------
            PLUGIN KEYMAPS
 --------------------------------- ]]

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
keymap("n", "<silent> <Leader>vs", ":vsplit <Bar> :wincmd l <Bar> :Files <CR>", opts)



--[[ Access specific files on my machine ]]
keymap("n", "<leader>nvim", ":e $HOME/.config/nvim/init.lua<CR>",  opts )
keymap("n", "<leader>tmux", ":e $HOME/.tmux.conf<CR>",  opts )
keymap("n", "<leader>bash", ":e $HOME/.bashrc<CR>",  opts )
keymap("n", "<leader>so", ":source $HOME/.config/nvim/init.lua<CR>",  opts )



--[[ LaTeX remaps ]]
-- In LaTeX files, set linebreak and wrap text around terminal column limits
autocmd({"BufNewFile", "BufRead"}, { pattern = {"*.tex", "*.txt"}, command = [[set wrap]]})
autocmd({"BufNewFile", "BufRead"}, { pattern = {"*.tex", "*.txt"}, command = [[set linebreak]]})

-- function to set movement mappings for LaTex (wrapped text)
function SetMovementsInLatex()
  keymap("n", "j", "v:count ? 'j' : 'gj'", expr_opts )
  keymap("n", "k", "v:count ? 'k' : 'gk'", expr_opts )
  keymap("v", "j", "v:count ? 'j' : 'gj'", expr_opts )
  keymap("v", "k", "v:count ? 'k' : 'gk'", expr_opts )
end
autocmd({"BufNewFile", "BufRead"}, { pattern = {"*.tex", "*.txt"}, command = [[ lua SetMovementsInLatex() ]]})



--[[ Misscelanious keymaps ]]
vim.api.nvim_set_keymap("n", "<leader>rg", ":Rg<SPACE>", opts ) -- RipGrep remap
--vim.api.nvim_set_keymap("n", "<leader>u", ":UndotreeShow<CR>", opts ) -- shows undo tree
-- Clip selection from visual mode and copy to clipboard
vim.api.nvim_set_keymap("v", "<leader>pp", ":%w !xclip -selection clipboard<CR><CR> :echo 'Selection clipped!'<CR>", opts )
-- This actually maps the :W to :write !! I do this because I fat finger the :write command to :W often
vim.cmd[[command! -nargs=* W w]]
vim.cmd[[command! -nargs=* Wq wq]]
vim.cmd[[command! -nargs=* Q q]]

-- Toggle Quickfix list
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
vim.api.nvim_set_keymap("n", "<leader>c", ":lua QuickfixToggle()<CR>", opts ) -- Toggle QuickFixList in LaTeX files

-- *.lib files are recognised as cobol. Set syntax off when entering a cobol file
function FuckCobol()
    if vim.opt.filetype:get() == 'cobol' then vim.cmd[[ syntax off ]] end
end
autocmd({"BufEnter"}, { pattern = {"*.lib"}, command = [[ :lua FuckCobol() ]]})
