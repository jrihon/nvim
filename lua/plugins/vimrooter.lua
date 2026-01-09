return {
    "airblade/vim-rooter",
    init = function ()
        vim.cmd[[let g:rooter_patterns = [".git", ".gitignore", "src/"] ]] -- detect root dir
        vim.cmd[[let g:rooter_silent_chdir = 1]] -- do not echo root directory all the time
    end
}
