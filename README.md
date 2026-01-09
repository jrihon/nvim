# nvim

## Installation

- Keep this in the `~/.config/` directory .

- Uses [lazy.nvim](https://github.com/folke/lazy.nvim)

- Neovim configuration, written in Lua. Using LSP support and `cmp`-based completion engine.

- Build everything from source [neovim/neovim](https://github.com/neovim/neovim) .
    - Dependencies : 
    ```bash
    $ sudo apt-get install ninja-build gettext cmake unzip curl
    $ sudo apt install luajit libluajit-5.1-dev lua-mpack lua-lpeg libunibilium-dev libmsgpack-dev libtermkey-dev
    ```
    - Install :
    ```bash
    $ git clone https://github.com/neovim/neovim        # clone repostitory
    $ cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo # make build files
    $ sudo make install                                 # install neovim

    # Optional
    $ alias nv="PATH/TO/neovim/build/bin/nvim"
    ```
- I use the [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads). Add contents of zip to `$HOME/.local/share/fonts`


## Using pyright
Before using pyright, first install `nvm` and `npm` through this [link](https://nodejs.org/en/download/)

The `after/` directory is for specific, customised plugins for the lsp

## Lua config layout
```
~/.config/nvim/ 
    ├── after
    │   └── lsp
    │       └── lua_ls.lua
    ├── init.lua
    ├── lazy-lock.json
    ├── lua
    │   ├── config
    │   │   ├── keymaps.lua
    │   │   └── options.lua
    │   ├── lsp.lua
    │   └── plugins
    │       ├── autopairs.lua
    │       ├── colorscheme.lua
    │       ├── comfortable_motion.lua
    │       ├── lsp
    │       │   ├── lsp-completion.lua
    │       │   └── mason.lua
    │       ├── mutineer.lua
    │       ├── nvim-cmp.lua
    │       ├── nvim-tree.lua
    │       ├── statuslines.lua
    │       ├── telescope.lua
    │       └── toggleterm.lua
    └── README.md
```
