return {
  -- https://github.com/nvim-neotest/neotest
  -- NOTE: Yanking a text from output is not an issue with neotest but unimplemented
  -- feature in Neovim.
  -- Flow:
  --   neotest -> saves test output in file -> write to buffer -> create term window
  -- Output may contain ANSI escape chars so they must be opened by terminal.
  -- History:
  -- Terminal window reflow is implmeneted so adjusting window width will automatcially
  -- adjust the text, but softwrapping terminal output is not implemented
  -- https://github.com/neovim/neovim/pull/21124#issuecomment-2354869610
  -- See https://www.reddit.com/r/neovim/comments/1dak3rw/longs_lines_in_terminal_are_copied_with_newlines/
  --
  -- NOTE: copen windowd is currently set by QuickfixCmdPost in go.nvim plugin
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest", -- Jest
    { "fredrikaverpil/neotest-golang", version = "*" }, -- Golang
    {
      "rcasia/neotest-java",
      ft = "java",
      dependencies = {
        "mfussenegger/nvim-jdtls",
        "mfussenegger/nvim-dap", -- for the debugger
        "rcarriga/nvim-dap-ui", -- recommended
        "theHamsta/nvim-dap-virtual-text", -- recommended
      },
    },
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),

        -- gotestsum replaces go test runner with structured output
        -- https://github.com/gotestyourself/gotestsum
        require("neotest-golang")({
          runner = "gotestsum",
          -- NOTE: shouldn't do this but dependencies have a lot of these
          warn_test_name_dupes = false,
        }), -- Golang Registration

        -- Java
        require("neotest-java")({
          -- config here
          default_version = "1.10.2",
        }),
      },
      diagnostic = {
        enabled = false,
      },
      highlights = {
        adapter_name = "NeotestAdapterName",
        border = "NeotestBorder",
        dir = "NeotestDir",
        expand_marker = "NeotestExpandMarker",
        failed = "NeotestFailed",
        file = "NeotestFile",
        focused = "NeotestFocused",
        indent = "NeotestIndent",
        namespace = "NeotestNamespace",
        passed = "NeotestPassed",
        running = "NeotestRunning",
        skipped = "NeotestSkipped",
        test = "NeotestTest",
      },
      -- floating changes the style of the floating window (e.g. output when 'o' is pressed)
      -- NOTE: changing max_width changes the window width but the output is still
      -- splitted with a newline that doesn't fit in the window. It implies there
      -- the newline is filled from upstream
      floating = {
        border = "rounded",
        max_height = 0.6,
        max_width = 0.6,
        options = {
          wrap = true,
        },
      },
      -- quickfix = {
      --   open = function()
      --     vim.api.nvim_command 'botright cwindow'
      --   end,
      -- },
      icons = {
        child_indent = "│",
        child_prefix = "├",
        collapsed = "─",
        expanded = "╮",
        failed = "✖",
        final_child_indent = " ",
        final_child_prefix = "╰",
        non_collapsible = "─",
        passed = "✔",
        running = "",
        unknown = "?",
      },
      output = {
        enabled = true,
        open_on_run = true,
        options = {
          wrap = true,
        },
      },

      output_panel = {
        enabled = true,
        open = "bo split | resize 13",
      },
      run = {
        enabled = true,
      },
      status = {
        enabled = true,
      },
      strategies = {
        integrated = {
          height = 40,
          width = 120,
        },
      },
      -- summary is the summary of all discovered tests in a tree
      summary = {
        enabled = true,
        expand_errors = true,
        follow = true,
        mappings = {
          attach = "a",
          expand = { "<CR>", "<2-LeftMouse>" },
          expand_all = "e",
          jumpto = "i",
          output = "o",
          run = "r",
          short = "O",
          stop = "u",
        },
      },
      open = "bo split | resize 13",
    })
  end,
}
