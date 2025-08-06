return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "neovim/nvim-lspconfig",
    "kevinhwang91/promise-async",
  },
  event = "VeryLazy",
  opts = {},

  init = function()
    vim.o.foldcolumn = "1" -- '0' is not bad
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  config = function()
    local ufo = require("ufo")
    -- https://github.com/jdhao/nvim-config/blob/6e60475f3f956ee4b7a2a2deea47f44d9676ed9a/lua/config/nvim_ufo.lua
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local foldedLines = endLnum - lnum
      local suffix = (" 󰁂  %d"):format(foldedLines)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          -- str width returned from truncate() may less than 2nd argument, need padding
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      local rAlignAppndx = math.max(math.min(vim.opt.textwidth["_value"], width - 1) - curWidth - sufWidth, 0)
      suffix = (" "):rep(rAlignAppndx) .. suffix
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end
    ---@diagnostic disable-next-line: missing-fields
    ufo.setup({
      fold_virt_text_handler = handler,
    })
    vim.keymap.set("n", "zR", ufo.openAllFolds)
    vim.keymap.set("n", "zM", ufo.closeAllFolds)
  end,
}
