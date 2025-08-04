-- autopairs
-- https://github.com/windwp/nvim-autopairs
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {
    check_ts = true, -- use treesitter to check
  },
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
