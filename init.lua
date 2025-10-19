-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]

-- SQL related plugin maps C-c to completion causing conflicts with completion
-- https://github.com/hrsh7th/nvim-compe/issues/286#issuecomment-805140394
-- https://neovim.io/doc/user/ft_sql.html
vim.g.omni_sql_no_default_maps = 1

-- Disable markdown builtin style to override with editorconfig
-- https://neovim.io/doc/user/filetype.html#ft-markdown-plugin
vim.g.markdown_recommended_style = 0

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- use treesitter for folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevel = 99

-- Use plugin statuscol instead
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
-- show both absolute and relative number
vim.o.statuscolumn = "%s %l %r "
-- Also can have it call custom function
-- vim.o.statuscolumn = "%!v:lua.require('statuscolumn').number()"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = "unnamedplus"

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
-- initial value
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Use editorconfig instead
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

-- Column ruler
-- https://neovim.io/doc/user/options.html#'colorcolumn'
vim.opt.colorcolumn = "100"

-- https://github.com/epwalsh/obsidian.nvim
-- https://github.com/epwalsh/obsidian.nvim/issues/286
vim.opt.conceallevel = 2

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "=", [[<cmd>vertical resize +2<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -1<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- <C-c> causes lua scripts to abort
-- https://github.com/kevinhwang91/nvim-ufo/issues/202#issuecomment-1950969654
vim.keymap.set("i", "<C-c>", "<esc>", { noremap = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Paste without replacing register
-- https://www.youtube.com/watch?v=qZO9A5F6BZs
vim.keymap.set("x", "<leader>p", '"_dp')

-- This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<C-F1>", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "=", [[<cmd>vertical resize +2<cr>]]) -- make the window biger vertically
vim.keymap.set("n", "-", [[<cmd>vertical resize -2<cr>]]) -- make the window smaller vertically
vim.keymap.set("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -

-- [[ Basic Autocommands ]]
-- Debug
-- vim.api.nvim_create_autocmd("BufEnter", {
--   desc = "DEBUG: BufEnter",
--   group = vim.api.nvim_create_augroup("debug", { clear = true }),
--   callback = function()
--     print("BufEnter! " .. vim.fn.expand("%:p") .. vim.fn.strftime("%H:%M:%S"))
--   end,
-- })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Restore cursor position on file open
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "*" },
  callback = function()
    ---@diagnostic disable-next-line: deprecated
    vim.api.nvim_exec('silent! normal! g`"zv', false)
    -- vim.cmd("normal: g;")
  end,
})

-- make quickfix windows always span over bottom of all vertical windows
-- vim.api.nvim_create_autocmd({ 'QuickFixCmdPost' }, {
--   pattern = { '[^l]*' },
--   nested = true,
--   command = 'botright cwindow',
-- })

-- [[ non-plugin imports ]]
require("godot")

-- [[ Configure and install plugins ]]
-- https://github.com/folke/lazy.nvim
-- Note to be confused with LazyVim which is a pre-packaged Neovim (also uses lazy.nvim)
-- Configuration https://lazy.folke.io/configuration
-- Plugin spec   https://lazy.folke.io/spec/examples
require("lazy").setup({
  -- [[ Plugins ]]
  -- require("plugins.perfanno") -- benchmark lua
  -- require("plugins.avante"), -- AI tool like cursor
  -- require("plugins.hardtime"), -- adds gitsigns recommend keymaps
  -- require("plugins.lint"),
  require("plugins.autopairs"), -- pair parens/brackets/etc
  require("plugins.blink-cmp"), -- completion
  require("plugins.comment"), -- visual comment + 'gcc'
  require("plugins.conform"), -- autoformatter. h: conform-formatters
  require("plugins.debug"), -- debugger
  require("plugins.diffview"), -- better diff view
  require("plugins.gitsigns"),
  require("plugins.go-nvim"), -- golang support
  require("plugins.image"), -- render image
  require("plugins.indent_line"),
  require("plugins.lazydev"),
  require("plugins.lazygit"), -- lazygit CLI integration
  require("plugins.lualine"), -- line status bar at the bottom
  require("plugins.mini"), -- collection of various small independent plugins/modules
  require("plugins.neoscroll"), -- smooth scroll
  require("plugins.neotest"), -- test management
  require("plugins.neo-tree"), -- test management
  require("plugins.nvim-jdtls"), -- java LSP
  -- replaced by nvim-jdtls
  -- require("plugins.nvim-java"), -- java LSP
  require("plugins.nvim-lint"), --
  require("plugins.nvim-lspconfig"), -- lsp common configs
  -- replaced by neo-tree
  -- require("plugins.nvim-tree"), -- tree menu
  require("plugins.nvim-treesitter"), -- highlight, edit, and navigate code
  require("plugins.nvim-ts-autotag"), -- Automatically close tags
  require("plugins.nvim-ufo"), -- prettier collapse
  require("plugins.obsidian"), -- obsidian
  require("plugins.project"), -- switch between git projects
  require("plugins.remote-nvim"), -- nvim remote connection
  require("plugins.render-markdown"), -- markdown rendering
  require("plugins.statuscol"), -- status column visualization
  -- not working
  -- require("plugins.sonarlint"),
  require("plugins.telescope"), -- find everything
  require("plugins.todo-comments"), -- highlight todos
  require("plugins.undotree"), -- Visualize undos
  require("plugins.vim-sleuth"), -- auto adjust shiftwidth/exandtab based on heuristic
  require("plugins.vim-tmux-navigator"), -- tmux integration
  require("plugins.vim-visual-multi"), -- nvim remote connection
  require("plugins.vindent"), -- auto adjust shiftwidth/exandtab based on heuristic
  require("plugins.which-key"), -- key binding

  -- [[ Themes ]]
  require("themes.tokyonight"),
  require("themes.onedarkpro"),
  require("themes.catppuccin"),

  -- The import below can automatically add your own plugins, configuration, etc
  -- from `lua/custom/plugins/*.lua`
  -- For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
