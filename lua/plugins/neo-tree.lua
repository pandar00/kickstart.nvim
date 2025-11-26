vim.keymap.set("n", "<C-F1>", ":Neotree toggle<CR>")
vim.keymap.set("n", "<C-F2>", ":Neotree action=show source=git_status position=left toggle=true<CR>")
vim.keymap.set("n", "<C-F3>", ":Neotree action=show source=document_symbols position=left toggle=true<CR>")
vim.keymap.set("n", "|", ":Neotree reveal<CR>")
-- NeoTreeCursorLine
-- NeoTreeCursorLine xxx links to CursorLine
-- CursorLine     xxx guibg=#282c34
-- 31353f
-- vim.cmd([[
--   highlight CursorLine guibg=#31353f
-- ]])
vim.cmd.highlight({ "NeoTreeCursorLine", "guibg=#31353f" })
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    use_default_mappings = true,
    -- Defaults
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/46fa0c22ca39e05fe15744102d21feb07fe9a94a/lua/neo-tree/defaults.lua#L501
    opts = {
      default_component_configs = {
        file_size = {
          -- file size overlaps with file
          enabled = false,
        },
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      filesystem = {
        filtered_items = {
          visible = true, -- when true, they will just be displayed differently than normal items
        },
        group_empty_dirs = true,
      },
      window = {
        mappings = {
          ["F"] = {
            function(state)
              local node = state.tree:get_node()
              local builtin = require("telescope.builtin")
              builtin.live_grep({
                search_dirs = { node.path },
              })
            end,
            desc = "find in dir",
          },
        },
      },
    },
  },
}
