local keymap = vim.keymap -- for conciseness
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "Show LSP hover definition"
    keymap.set("n", "gH", function()
        vim.lsp.buf.hover {
            border = "single"
        }
    end,
    opts)

    opts.desc = "Format the current buffer"
    keymap.set("n", "gF", vim.lsp.buf.format, opts)

    opts.desc = "Show LSP signature"
    keymap.set("n", "gS", vim.lsp.buf.signature_help, opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "gl", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definition"
    keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definition

    opts.desc = "Show LSP references"
    keymap.set("n", "gr", ":Telescope lsp_references<CR>", opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "gI", ":Telescope lsp_implementations<CR>", opts) -- show lsp implementations

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "gt", ":Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "gc", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    keymap.set("n", "grn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Show line diagnostics"
    keymap.set("n", "gD", vim.diagnostic.open_float, opts) -- show diagnostics for line

--    opts.desc = "Go to previous diagnostic"
--    keymap.set("n", "[d", function()
--      vim.diagnostic.jump({ count = -1, float = true })
--    end, opts) -- jump to previous diagnostic in buffer
--    --
--    opts.desc = "Go to next diagnostic"
--    keymap.set("n", "]d", function()
--      vim.diagnostic.jump({ count = 1, float = true })
--    end, opts) -- jump to next diagnostic in buffer

    opts.desc = "Restart LSP"
    keymap.set("n", "grs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})

-- vim.lsp.inlay_hint.enable(true)

local severity = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = true,
  update_in_sert = false,
  severity_sort = true,
  float = {
    focusable = true,
  --          style = 'minimal',
    border = 'rounded', -- none, single, double, rounded, solid, shadow
    source = true,
  --          header = "",
  --          prefix = "",
  },

  signs = {
    text = {
      [severity.ERROR] = " ",
      [severity.WARN] = " ",
      [severity.HINT] = "󰠠 ",
      [severity.INFO] = " ",
    },
  },
})
