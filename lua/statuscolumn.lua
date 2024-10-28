local statuscolumn = {}

-- https://www.reddit.com/r/neovim/comments/1djjc6q/statuscolumn_a_beginers_guide/

statuscolumn.setHl = function()
  local colors = { '#caa6f7', '#c1a6f1', '#b9a5ea', '#b1a4e4', '#aba3dc', '#a5a2d4', '#9fa0cc', '#9b9ec4', '#979cbc', '#949ab3' }

  for i, color in ipairs(colors) do
    vim.api.nvim_set_hl(0, 'Gradient_' .. i, { fg = color })
  end
end

statuscolumn.number = function()
  -- As a failsafe we will return an empty string if something breaks
  local text = ''

  -- This is how plugins set the default options for a configuration table(an empty table is used if the user config is nil)
  -- This merges the default values and the user provided values so that you don't need to have all the keys in your config table
  -- local config = vim.tbl_extend('keep', user_config or {}, {
  --   colors = nil,
  --   mode = 'normal',
  -- })

  -- islist() was previously called tbl_islist() so use that if you are using an older version
  -- if config.colors ~= nil and vim.islist(config.colors) == true then
  --   for rel_numb, hl in ipairs(config.colors) do
  --     -- Only 1 highlight group
  --     if (vim.v.relnum + 1) == rel_num then
  --       text = '%#' .. colors .. '#'
  --       break
  --     end
  --   end
  --
  --   -- If the string is still empty then use the last color
  --   if text == '' then
  --     text = '%#' .. config.colors[#config.colors] .. '#'
  --   end
  -- end

  -- if config.mode == 'normal' then
  --   text = text .. vim.v.lnum
  -- elseif config.mode == 'relative' then
  --   text = text .. vim.v.relnum
  -- elseif config.mode == 'hybrid' then
  --   return vim.v.relnum == 0 and text .. vim.v.lnum or text .. vim.v.relnum
  -- end

  -- Simple task:
  -- If cursor is at the current line, then show the line number
  -- If not, then show the relative number
  return text
end

-- With this line we will be able to use myStatuscolumn by requiring this file and calling the function
return statuscolumn
