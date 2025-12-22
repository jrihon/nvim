# nvim

## Installation

- Keep this in the `~/.config/` directory .

- Uses [packer.nvim](https://github.com/wbthomason/packer.nvim)

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

- In order to use Mason (the LSP manager), install the Javascript package manager Node 
    ```bash
    $ sudo apt install npm
    ```


## Lua config layout
```
~/.config/nvim/ 
    - init.lua
    - lua/jrihon/
        - *.lua
        - lsp/
            - *.lua
            - settings/
                *.lua
```

## Plugging my content
Consider using [GoTo.nvim](https://github.com/jrihon/goto.nvim) to navigate throughout your lua configs with more ease.
