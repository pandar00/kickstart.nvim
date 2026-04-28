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
      discovery = {
        concurrent = 1,
        enabled = true,
        filter_dir = function(name, rel_path, root)
          -- assumes go source is in the following dir
          local goroot = "/usr/local/go/src"
          if root:sub(1, #goroot) == goroot then
            return false
          end
          local gopkg = "/home/hcho/go/pkg/mod"
          if root:sub(1, #gopkg) == gopkg then
            return false
          end
          -- assumes "venv" is at the root of the project (i.e. rel_path)
          local venv = "venv"
          if rel_path:sub(1, #venv) == venv then
            return false
          end
          -- print(name .. "|" .. rel_path .. "|" .. root)
          -- models|tests/parser/bind/models|/home/hcho/Programming/git/echoapi
          return true
        end,
      },
      diagnostic = {
        enabled = true,
      },
      floating = {
        border = "rounded",
        max_height = 0.6, -- output floating height
        max_width = 0.6, -- output floating width
        options = {
          wrap = true,
        },
      },
      -- per-test output
      output = {
        enabled = true,
        open_on_run = true, -- open it after running
      },
      -- output panel records all output of tests over time in a single window
      output_panel = {
        enabled = true,
        open = "bo split | resize 13",
      },
      -- summary is the summary of all discovered tests in a tree
    })
  end,
}
