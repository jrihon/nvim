# nvim

### Installation

- Keep this in the `~/.config/` directory .

- Uses [packer.nvim](https://github.com/wbthomason/packer.nvim)

- Neovim configuration, written in Lua. Using LSP support and `cmp`-based completion engine.

- Build everything from source [neovim/neovim](https://github.com/neovim/neovim) .

### Lua config layout
```
~/.config/nvim/ - init.lua
                - lua/jrihon/ - *.lua
                              - lsp/ - *.lua
                                     - settings/ *.lua
```

Consider using [GoTo.nvim](https://github.com/jrihon/goto.nvim) to navigate throughout your lua configs with more ease.
