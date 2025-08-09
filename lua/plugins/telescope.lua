-- https://github.com/nvim-telescope/telescope.nvim
return {
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { -- If encountering errors, see telescope-fzf-native README for installation instructions
      "nvim-telescope/telescope-fzf-native.nvim",

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = "make",

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    { "nvim-telescope/telescope-ui-select.nvim" },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    require("telescope").setup({
      -- override defaults
      defaults = {
        path_display = {
          "filename_first",
          shorten = {
            len = 4,
            exclude = { -1, -2 },
          },
        },
        mappings = {
          i = {
            ["<esc>"] = actions.close,
          },
        },
        file_ignore_patterns = {
          ".excalidraw.md",
        },
        dynamic_preview_title = true,
      },

      -- override pickers
      pickers = {
        help_tags = {
          -- for help tags, make the selection open in vertical mode
          mappings = {
            i = {
              ["<cr>"] = actions.select_vertical,
            },
            n = {
              ["<cr>"] = actions.select_vertical,
            },
          },
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    local exts = require("telescope").extensions
    -- See `:help telescope.builtin`
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sa", builtin.autocommands, { desc = "[S]earch [A]utocommands" })
    vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>si", builtin.highlights, { desc = "[S]earch h[i]ghlight" })
    vim.keymap.set("n", "<leader>sc", function()
      builtin.colorscheme({ enable_preview = true })
    end, { desc = "[S]earch [c]olorscheme" })
    -- Shows a list of all filetypes and changes the current buffer's filetype on select
    -- vim.keymap.set('n', '<leader>st', builtin.filetypes, { desc = '[S]earch File[t]ypes' })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[S]earch [M]arks" })
    vim.keymap.set("n", "<leader>sl", builtin.man_pages, { desc = "[S]earch Manua[l] Pages" })
    vim.keymap.set("n", "<leader>sp", exts.projects.projects, { desc = "[S]earch [P]rojects" })
    vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>sj", builtin.jumplist, { desc = "[S]earch [J]umplist" })
    vim.keymap.set("n", "<leader>oo", ":Obsidian open<CR>", { desc = "[O]bsidian [O]pen" })
    vim.keymap.set("n", "<leader>of", ":Obsidian follow_link<CR>", { desc = "[O]bsidian [F]ollow Link" })
    vim.keymap.set("n", "<leader>ow", ":Obsidian workspace<CR>", { desc = "[O]bsidian [W]orkspace" })
    vim.keymap.set("n", "<leader>ot", ":Obsidian tags<CR>", { desc = "[O]bsidian [T]ags" })
    vim.keymap.set("n", "<leader>od", ":Obsidian today<CR>", { desc = "[O]bsidian [D]aily (:ObsidianToday)" })
    vim.keymap.set("n", "<leader>so", ":Obsidian search<CR>", { desc = "[S]earch [O]bsidian" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set("n", "<leader>s/", function()
      builtin.live_grep({
        grep_open_files = true,
        prompt_title = "Live Grep in Open Files",
      })
    end, { desc = "[S]earch [/] in Open Files" })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[S]earch [N]eovim files" })
  end,
}
