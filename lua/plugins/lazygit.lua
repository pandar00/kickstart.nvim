return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- setting the keybinding for LazyGit with 'keys' ls recommended in
  -- order to load the plugin when the command is run for the first time
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1 -- fullscreen
    -- use plenary.nvim to manage floating window if available
    -- for some reason, gitlazy window border corrupts subsequent telescope borders
    vim.g.lazygit_floating_window_use_plenary = 0
    require("telescope").load_extension("lazygit")
    -- code
  end,
}
