
-- Add autopairing for inline $$ environment in latex

local opts_autopairs = {
  check_ts = true, -- treesitter integration
  map_cr = false, -- do not remap Carriage Return <CR>, this fucks up my entire nvim config
  disable_filetype = { "TelescopePrompt" },
  -- {
  --   -- does not work
  --   function()
  --       local Rule = require('nvim-autopairs.rule')
  --       local npairs = require('nvim-autopairs')
  --       npairs.add_rule(Rule("$","$","tex"))
  --       npairs.add_rule(Rule("$","$","typst"))
  --   end
  -- },
}

return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = opts_autopairs,
    config = true,
}

--local cmp_autopairs = require("nvim-autopairs.completion.cmp")
--local cmp_status_ok, cmp = pcall(require, "cmp")
--if not cmp_status_ok then
--  return
--end
--cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done {})
