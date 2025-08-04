return {
  -- Line number column formatting.
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      setopt = true,
      relculright = true, -- aligns the curr ln right

      -- segments = {
      --   { text = { '%C' }, click = 'v:lua.ScFa' },
      --   { text = { '%s' }, click = 'v:lua.ScSa' },
      --   {
      --     text = { builtin.lnumfunc, ' ' },
      --     condition = { true, builtin.not_empty },
      --     click = 'v:lua.ScLa',
      --   },
      -- },
    })
  end,
}
