-- Setup nvim-cmp.
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

npairs.setup {
  check_ts = true, -- treesitter integration
  map_cr = false, -- do not remap Carriage Return <CR>, this fucks up my entire nvim config
  disable_filetype = { "TelescopePrompt" },
}

-- Add autopairing for inline $$ environment in latex
local Rule = require('nvim-autopairs.rule')
npairs.add_rule(Rule("$","$","tex"))
npairs.add_rule(Rule("$","$","typst"))

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
