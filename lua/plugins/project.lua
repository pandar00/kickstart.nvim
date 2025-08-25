return {
  "DrKJeff16/project.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  lazy = false,
  config = function()
    require("project").setup({
      -- NOTE:
      -- CWD switches back to the previous project if the selected project root cannot be found.
      -- LSP is loaded asynchrously so it's always going to fail to find the root on the
      -- initial load.
      --
      -- Operation steps:
      --    buffer 1: initial buffer
      --    telescope project list popup
      --    project selection -> changes currently working directory
      --    telescope project *file* list
      --    select a file
      --    buffer open buffer 1 -> AutoCommand on_buf_enter (iterates detection methods)
      --    buffer open buffer 2 -> AutoCommand on_buf_enter (iterates detection methods)
      detection_methods = { "pattern", "lsp" },
      -- silent_chdir = false, -- for debugging
      patterns = {
        ".git",
        ".obsidian",
        "go.mod",
      },
    })
    require("telescope").load_extension("projects")
  end,
  -- opts = {},
}
