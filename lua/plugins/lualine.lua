-- https://github.com/nvim-lualine/lualine.nvim
return {
  -- +-------------------------------------------------+
  -- | A | B | C                             X | Y | Z |
  -- +-------------------------------------------------+
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- config = function()
  --   ---@diagnostic disable-next-line: missing-parameter
  --   require('lualine').setup
  -- end,
  opts = {
    options = {
      component_separators = { left = "│", right = "│" },
      section_separators = { left = "█", right = "█" },
      -- component_separators = { left = '', right = ''},
      -- section_separators = { left = '', right = ''},
      globalstatus = true,
    },
    sections = {
      lualine_x = {
        "encoding",
        "fileformat",
        "filetype",
        {
          -- https://github.com/jdhao/nvim-config/blob/a602d9881982ec209218299bad200c98f53b2259/lua/config/lualine.lua#L206
          function()
            local msg = "No Active Lsp"
            local buf_ft = vim.api.nvim_get_option_value("filetype", {})
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if next(clients) == nil then
              return msg
            end

            for _, client in ipairs(clients) do
              ---@diagnostic disable-next-line: undefined-field
              local filetypes = client.config.filetypes
              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
              end
            end
            return msg
          end,
        },
      },
      lualine_c = {
        {
          "filename",
          path = 3, -- relative path
          -- shortening_target = 40, -- shortens to leave N chars for other components
        },
      },
    },
    extensions = { "nvim-tree" },
  },
}
