return {
  "mbbill/undotree",
  lazy = false,
  config = function()
    vim.g.undotree_SplitWidth = 40
    vim.g.undotree_DiffpanelHeight = 20
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_SetFocusWhenToggle = 1

    -- Undotree
    -- https://github.com/mbbill/undotree
    vim.keymap.set("n", "<C-F4>", function()
      -- source vim script
      -- let targetWinnr = -1
      -- for winnr in range(1, winnr('$')) "winnr starts from 1
      --     if (getwinvar(winnr,'undotree_id') == a:targetid)
      --                 \&& winbufnr(winnr) == a:targetBufnr
      --         let targetWinnr = winnr
      --     endif
      -- endfor
      -- if targetWinnr == -1
      --     return
      -- endif
      vim.cmd.UndotreeToggle()

      -- option 1. reset width on reopen
      -- option 2. do not allow neotree and undotree to open at the same time
      -- for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      --   print(vim.inspect(win))
      --   print(vim.w[win].undotree_id)
      --   if vim.w[win].undotree_id ~= nil then
      --     vim.w[win].width = 30
      --     print(vim.w[win].undotree_id .. 'setting width' .. 40)
      --     --   vim.api.nvim_win_set_width(win, 40)
      --   end
      -- end
      --
    end, { desc = "Toggle [u]ndotree" })
  end,
}
