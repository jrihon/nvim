return {
    "hrsh7th/cmp-nvim-lsp",
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        -- import plugin
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- used to enable autocompletion
        local capabilities = cmp_nvim_lsp.default_capabilities()

        vim.lsp.config("*", {
            capabilities = capabilities
        })

    end
}
