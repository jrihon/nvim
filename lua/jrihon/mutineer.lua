--[[ ------------------------------------------------------------------
                            MUTINEER CONFIGURATION
  ------------------------------------------------------------------ ]]

local mutineer_status_ok, mutineer = pcall(require,'mutineer')
if not mutineer_status_ok then
    return
end

mutineer.setup({
        lineCommentSymbols = {lisp = ';',
                              fennel = ";;",
                              yaml = "#",
                              typst = "//",
                              toml = "#"}
})

