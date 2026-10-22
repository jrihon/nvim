return {
  {
    "nextflow-io/vim-language-nextflow",
    ft = { "nextflow" },
    init = function()
      -- Ensures .nf files trigger the 'nextflow' filetype
      vim.filetype.add({
        extension = {
          nf = "nextflow",
        },
      })
    end,
  },
}

