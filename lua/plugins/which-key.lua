-- https://github.com/folke/which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VimEnter", -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require("which-key").setup({
      spec = {
        { "<leader>c", group = "[C]ode" },
        { "<leader>c_", hidden = true },
        { "<leader>d", group = "[D]ocument" },
        { "<leader>d_", hidden = true },
        { "<leader>h", group = "Git [H]unk" },
        { "<leader>h_", hidden = true },
        { "<leader>r", group = "[R]ename" },
        { "<leader>r_", hidden = true },
        { "<leader>s", group = "[S]earch" },
        { "<leader>s_", hidden = true },
        { "<leader>t", group = "[T]est" },
        { "<leader>t_", hidden = true },
        { "<leader>w", group = "[W]orkspace" },
        { "<leader>w_", hidden = true },
        { "<leader>h", desc = "Git [H]unk", mode = "v" },
      },
    })

    -- https://github.com/folke/which-key.nvim/issues/135#issuecomment-898175086
    local wkl = require("which-key")
    vim.cmd("autocmd FileType * lua setKeybinds()")
    function setKeybinds()
      local fileTy = vim.api.nvim_get_option_value("filetype", { buf = 0 })

      local getft = function()
        return vim.api.nvim_get_option_value("filetype", { buf = 0 })
      end

      wkl.add({
          -- stylua: ignore 
          { "<C-F5>", function() require("neotest").summary.toggle() end, desc = "[T]est [S]ummary", },
      })
      -- common commands
      wkl.add({
            -- stylua: ignore start
            { "<leader>ta", function() require("neotest").run.attach() end, desc = "[t]est [a]ttach" },
            { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "[t]est run [f]ile" },
            { "<leader>tA", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "[t]est [A]ll files" },
            { "<leader>tS", function() require("neotest").run.run({ suite = true }) end, desc = "[t]est [S]uite" },
            { "<leader>tn", function() require("neotest").run.run() end, desc = "[t]est [n]earest" },
            { "<leader>tl", function() require("neotest").run.run_last() end, desc = "[t]est [l]ast" },
            { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "[t]est [s]ummary" },
            { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "[t]est [o]utput" },
            { "<leader>tO", function() require("neotest").output_panel.toggle() end, desc = "[t]est [O]utput panel" },
            { "<leader>tt", function() require("neotest").run.stop() end, desc = "[t]est [t]erminate" },
            { "<leader>td", function() require("neotest").run.run({ suite = false, strategy = "dap" }) end, desc = "Debug nearest test" },
            { "<leader>tD", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, desc = "Debug current file" },
        -- stylua: ignore end
      })

      -- buffer=true appears to make it buffer local
      -- note; cond appears to only control the initial register condition
      if fileTy == "go" then
          -- stylua: ignore start
          wkl.add({
            { "<leader>gf", "<cmd>GoFillStruct<cr>", desc = "[G]o [F]ill struct", buffer=true},
            { "<leader>gc", "<cmd>GoTermClose<cr>", desc = "[G]o Term [C]lose" , buffer=true},
            { "<leader>cl", "<cmd>GoLint<cr>", desc = "[C]ode [L]int" , buffer=true},
          })
        -- stylua: ignore end
      elseif fileTy == "typescript" then
        -- there
      end
    end
  end,
}
