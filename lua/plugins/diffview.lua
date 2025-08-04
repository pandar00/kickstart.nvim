return {
  "sindrets/diffview.nvim",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,
      view = {
        merge_tool = {
          -- Config for conflicted files in diff views during a merge or rebase.
          layout = "diff3_mixed",
          disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
          winbar_info = true, -- See |diffview-config-view.x.winbar_info|
        },
      },
    })
    -- FIXME: Get diffview working
    -- vim.keymap.set('n', '<leader>g', ':DiffviewOpen<CR>', { desc = 'Show diagnostic [E]rror messages' })
    local set = vim.opt -- set options
    set.fillchars = set.fillchars + "diff:╱"
  end,
}
