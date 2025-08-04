return {
  "karb94/neoscroll.nvim",
  config = function()
    -- Set mappings manually to override scroll duration.
    -- TODO: Plugin doesn't appear to provide a way to override only the duration.
    local neoscroll = require("neoscroll")
    neoscroll.setup({
      mappings = {}, -- Do not set any mappings. It's set in the later step.
      hide_cursor = true,
      stop_eof = true,
      respect_scrolloff = false,
      cursor_scrolls_alone = true,
      easing = "linear",
      pre_hook = nil,
      post_hook = nil,
      performance_mode = false,
    })
    -- Override mappings with custom duration.
    local mapping_funcs = {
      ["<C-u>"] = function()
        neoscroll.ctrl_u({ duration = 0 })
      end,
      ["<C-d>"] = function()
        neoscroll.ctrl_d({ duration = 0 })
      end,
    }
    local modes = { "n", "v", "x" }
    for k, v in pairs(mapping_funcs) do
      vim.keymap.set(modes, k, v)
    end
  end,
}
