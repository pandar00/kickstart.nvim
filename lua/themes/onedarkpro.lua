-- https://github.com/olimorris/onedarkpro.nvim
return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
    require("onedarkpro").setup({
      colors = {
        -- NOTE:
        -- Default cursorline has the same color as
        -- onedark background #282c34. Enabling cursorline
        -- from onedark pro sets cursorline to its own color
        --
        -- cursorline = "#31353f",
      },
      options = {
        -- See note above
        cursorline = true,
      },
    })
    vim.cmd.colorscheme("onedark")
  end,
}
