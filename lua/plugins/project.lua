return {
  "DrKJeff16/project.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("project_nvim").setup({
      detection_methods = {}, -- note; let telescope decide everything
      -- silent_chdir = false, -- for debugging
    })
    require("telescope").load_extension("projects")
  end,
  -- opts = {},
}
