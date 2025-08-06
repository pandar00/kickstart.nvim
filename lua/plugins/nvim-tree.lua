-- disable netrw at the very start of your init.lua
-- Use nvim-tree instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "<C-F1>", ":NvimTreeToggle<CR>")

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      filters = {
        custom = {
          "*.uid", -- godot uid file
        },
        exclude = {
          ".codebase",
          ".env.local",
        },
      },
      renderer = {
        root_folder_label = false,
      },
      actions = {
        file_popup = {
          open_win_config = {
            -- col = 1,
            -- row = 1,
            -- relative = 'cursor',
            border = "rounded",
            -- style = 'minimal',
          },
        },
      },
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        signcolumn = "auto",
        -- A table indicates that the view should be dynamically sized based on the longest
        -- line
        width = {
          -- set max just in case...
          max = 30,
        },
      },
    })
  end,
}
