--[[ ------------------------------------------------------------------
                            FZF CONFIGURATION
  ------------------------------------------------------------------ ]]
local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}


-- remap fzf ':Files' to call the function :Files. FZF to search in cwd or child directories
keymap("n", "<C-p>", ":Files<CR>", opts )
-- remap fzf ':Buffers' function so we can access whichever files are in our buffer
keymap("n", "<C-b>", ":Buffers<CR>", opts )
-- disable the :Windows command because I hate it when I shift+w inadvertedly when I just want to write to the buffer
-- This actually maps the :W to :write !! I do this because I fat finger the :write command to :W, which is :Windows in fzf
vim.cmd[[command! -nargs=* W w]]
vim.cmd[[command! -nargs=* Wq wq]]

--[[ DO THE FOLLOWING IF YOU WANT TO BE ABLE TO FIND HIDDEN FILES WHEN USING :Files 
 -g : matching pattern (In this case "", which is empty or None)
 --unrestricted : searches all filetypes except .gitignores, .ignore etc.
 --depth : how far you can go with searching into your directories (in this case 3)
 Add the following to your >> ~/.bashrc
     ## Fuzzy Finder
     export FZF_DEFAULT_COMMAND='ag -g "" --depth 3 --unrestricted'
     export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND                                 ]]

-- install the following "$ sudo apt install silversearcher-ag"
if vim.fn.executable('ag') == 0 then
    print("install silversearcher-ag through :\n$ sudo apt install silversearcher-ag")
end

-- install the following "$ sudo apt install silversearcher-ag"
if vim.fn.executable('rg') == 0 then
    print("install RipGrep through :\n$ sudo apt install ripgrep")
end
