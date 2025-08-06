return {
  -- Multi line cursor
  -- https://github.com/mg979/vim-visual-multi
  -- help: visual-multi
  "mg979/vim-visual-multi",
  -- init is where vim.g should be placed. Called on every plugin start
  init = function()
    vim.g.VM_leader = "<space>v"
    vim.g.VM_add_cursor_at_pos_no_mappings = 1
    vim.g.VM_maps = {
      ["Add Cursor Down"] = "<M-j>",
      ["Add Cursor Up"] = "<M-k>",
    }
  end,
}
