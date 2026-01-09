--[[ ------------------------------------------------------------------
                            MUTINEER CONFIGURATION
  ------------------------------------------------------------------ ]]


return({
  "jrihon/mutineer.lua", 
  opts = {
      lineCommentSymbols = {
      lisp = ';',
      fennel = ";;",
      yaml = "#",
      dockerfile = "#",
      typst = "//",
      toml = "#"
    },
  },
})

