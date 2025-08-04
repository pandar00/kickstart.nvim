return {
  "DrKJeff16/project.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("project_nvim").setup({})
    require("telescope").load_extension("projects")
  end,
  -- opts = {},
}
