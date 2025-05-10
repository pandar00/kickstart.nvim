--[[
If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- use treesitter for folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false
vim.opt.foldlevel = 99

-- Use plugin statuscol instead
-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
-- show both absolute and relative number
-- vim.o.statuscolumn = '%s %l %r '
-- Also can have it call custom function
-- vim.o.statuscolumn = "%!v:lua.require('statuscolumn').number()"

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

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
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Column ruler
-- https://neovim.io/doc/user/options.html#'colorcolumn'
vim.opt.colorcolumn = '100'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- <C-c> causes lua scripts to abort
-- https://github.com/kevinhwang91/nvim-ufo/issues/202#issuecomment-1950969654
vim.keymap.set('i', '<C-c>', '<esc>', { noremap = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- greatest remap ever!
-- https://www.youtube.com/watch?v=qZO9A5F6BZs
vim.keymap.set('x', '<leader>p', '"_dP')

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<C-\\>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-F1>', ':NvimTreeToggle<CR>')

-- Undotree
-- https://github.com/mbbill/undotree
vim.keymap.set('n', '<C-F4>', function()
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
end, { desc = 'Toggle [u]ndotree' })

-- [[ Basic Autocommands ]]

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Restore cursor position on file open
vim.api.nvim_create_autocmd({ 'BufReadPost' }, {
  pattern = { '*' },
  callback = function()
    ---@diagnostic disable-next-line: deprecated
    vim.api.nvim_exec('silent! normal! g`"zv', false)
    -- vim.cmd("normal: g;")
  end,
})

-- [[ Configure and install plugins ]]
-- https://github.com/folke/lazy.nvim
-- Note to be confused with LazyVim which is a pre-packaged Neovim (also uses lazy.nvim)
-- Configuration https://lazy.folke.io/configuration
-- Plugin spec   https://lazy.folke.io/spec/examples
require('lazy').setup({
  -- Detect tabstop and shiftwidth automatically, so managing those setting per file type
  -- is generally not needed
  -- (tag: indent)
  -- https://github.com/tpope/vim-sleuth
  { 'tpope/vim-sleuth' },

  -- "gc" to comment visual regions/lines; what enables 'gcc'
  -- https://github.com/numToStr/Comment.nvim
  { 'numToStr/Comment.nvim', opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  -- https://github.com/lewis6991/gitsigns.nvim
  -- TODO: bind keys
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- Useful plugin to show you pending keybinds. Bottom window that shows available key bindings
  -- https://github.com/folke/which-key.nvim
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup {
        spec = {
          { '<leader>c', group = '[C]ode' },
          { '<leader>c_', hidden = true },
          { '<leader>d', group = '[D]ocument' },
          { '<leader>d_', hidden = true },
          { '<leader>h', group = 'Git [H]unk' },
          { '<leader>h_', hidden = true },
          { '<leader>r', group = '[R]ename' },
          { '<leader>r_', hidden = true },
          { '<leader>s', group = '[S]earch' },
          { '<leader>s_', hidden = true },
          { '<leader>t', group = '[T]oggle' },
          { '<leader>t_', hidden = true },
          { '<leader>w', group = '[W]orkspace' },
          { '<leader>w_', hidden = true },
          { '<leader>h', desc = 'Git [H]unk', mode = 'v' },
        },
      }

      -- https://github.com/folke/which-key.nvim/issues/135#issuecomment-898175086
      local wkl = require 'which-key'
      vim.cmd 'autocmd FileType * lua setKeybinds()'
      function setKeybinds()
        local fileTy = vim.api.nvim_buf_get_option(0, 'filetype')
        local opts = { prefix = '<localleader>', buffer = 0 }
        wkl.add {
          {
            '<C-F5>',
            function()
              require('neotest').summary.toggle()
            end,
            desc = '[T]est [S]ummary',
          },
          {
            '<leader>tt',
            function()
              require('neotest').run.stop()
            end,
            desc = '[T]est [T]erminate',
          },
        }

        if fileTy == 'go' then
          wkl.add {
            -- { '<leader>ct', '<cmd>GoTest -n -F<cr>', desc = '[C]ode [T]est' },
            { '<leader>ctd', '<cmd>GoTest -n -F -a -test.count=1<cr>', desc = '[C]ode [T]est [D]isable Cache' },

            { '<leader>ctv', '<cmd>GoTest -n -F -v<cr>', desc = '[C]ode [T]est [V]erbose' },
            -- { '<leader>cta', '<cmd>GoTest -F<cr>', desc = '[C]ode Test [A]ll' },
            { '<leader>ctp', '<cmd>GoTest -p -F<cr>', desc = '[C]ode Test Current [P]ackage' },
            { '<leader>cl', '<cmd>GoLint<cr>', desc = '[C]ode [L]int' },

            -- Neotest
            { '<leader>ct', "<cmd>lua require('neotest').run.run()<cr>", desc = '[C]ode [T]est' },
            { '<leader>cta', '<cmd>GoTest -F<cr>', desc = '[C]ode Test [A]ll' },
            { '<leader>cts', "<cmd>lua require('neotest').run.run({ suite = true })<cr>", desc = '[C]ode [T]est [S]uite' },
            { '<leader>ctf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", desc = '[C]ode [T]est [F]ile' },
            { '<leader>cto', "<cmd>lua require('neotest').output.open({ enter = true, })<CR>", desc = '[C]ode [T]est [O]utput Open' },
            -- { '<leader>cto', "<cmd>lua require('neotest').output.open({ auto_close = false, })<CR>", desc = '[C]ode [T]est [O]utput Open' },
          }
        elseif fileTy == 'typescript' then
          wkl.add {
            -- https://github.com/ecosse3/nvim/blob/344706db1ad7c0cf7112714dd50eadc647fb81fc/lua/plugins/which-key/setup.lua#L223
            { '<leader>ct', "<cmd>lua require('neotest').run.run()<CR>", desc = '[C]ode [T]est' },
            { '<leader>ctc', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", desc = '[C]ode [T]est [C]urrent File' },
            { '<leader>cto', "<cmd>lua require('neotest').output.open({ enter = true, })<CR>", desc = '[C]ode [T]est [O]utput Open' },
            -- { '<leader>cto', "<cmd>lua require('neotest').output.open({ auto_close = true, })<CR>", desc = '[C]ode [T]est [O]utput Open' },
          }
          -- wkl.register({
          --   ['W'] = { ':w<CR>', 'test write' },
          --   ['Q'] = { ':q<CR>', 'test quit' },
          -- }, opts)
        end
      end

      -- local wk = require 'which-key'
      -- note: wk.add can call lua functions. e.g.) read buffer and run command
      -- based on filetype
      -- -- testing
      -- wk.add {
      --   '<leader>ct',
      --   function()
      --     local buf = vim.api.nvim_get_current_buf()
      --     local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
      --
      --     if ft == 'go' then
      --       -- { '<leader>ct', '<cmd>GoTest -n -F<cr>', desc = '[C]ode [T]est' },
      --       print 'im go'
      --     elseif ft == '' then
      --     end
      --   end,
      --   desc = '[C]ode [T]est',
      -- }
    end,
  },

  -- telescope. find everything
  -- https://github.com/nvim-telescope/telescope.nvim
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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
      local actions = require 'telescope.actions'
      local action_layout = require 'telescope.actions.layout'
      require('telescope').setup {
        -- override defaults
        defaults = {
          mappings = {
            i = {
              ['<esc>'] = actions.close,
            },
          },
        },

        -- override pickers
        pickers = {
          help_tags = {
            -- for help tags, make the selection open in vertical mode
            mappings = {
              i = {
                ['<cr>'] = actions.select_vertical,
              },
              n = {
                ['<cr>'] = actions.select_vertical,
              },
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      local exts = require('telescope').extensions
      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sa', builtin.autocommands, { desc = '[S]earch [A]utocommands' })
      vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>si', builtin.highlights, { desc = '[S]earch h[i]ghlight' })
      vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = '[S]earch [c]olorscheme' })
      -- Shows a list of all filetypes and changes the current buffer's filetype on select
      -- vim.keymap.set('n', '<leader>st', builtin.filetypes, { desc = '[S]earch File[t]ypes' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sm', builtin.marks, { desc = '[S]earch [M]arks' })
      vim.keymap.set('n', '<leader>sl', builtin.man_pages, { desc = '[S]earch Manua[l] Pages' })
      vim.keymap.set('n', '<leader>sp', exts.projects.projects, { desc = '[S]earch [P]rojects' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = '[S]earch [J]umplist' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },
  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  -- LSP Configuration & Plugins
  -- https://github.com/neovim/nvim-lspconfig
  -- tldr;
  -- * Various LSPs exist in the community
  -- * They require different configuration and installation
  -- * Mason helps installing them
  -- * LSP config centralizes the configuring those LSPs
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- We create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap.
          map('K', function()
            vim.lsp.buf.hover {
              border = 'rounded',
              max_width = 80,
            }
          end, 'Hover Documentation')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
      -- See https://github.com/kevinhwang91/nvim-ufo
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      -- NOTE: lsp configs are moved to after/lsp directory.
      -- https://github.com/nvim-lua/kickstart.nvim/pull/1475#issuecomment-2868630411
      local servers = {
        clangd = {}, -- C
        gopls = {}, -- Golang
        pyright = {}, -- Python
        marksman = {}, -- Markdown
        tailwindcss = {}, -- ?
        svelte = {}, -- svelt
        zls = {}, -- Ziglang
        bashls = {}, -- bash scripts
        dockerls = {}, -- Docker files
        yamlls = {},
        eslint = {},
        terraformls = {}, -- terraform
        jsonls = {},
        lua_ls = {},
        gdtoolkit = {}, -- gdscript
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_enable = true,
        -- automatic_installation = false,
      }

      vim.lsp.enable 'gdscript'
    end,
  },

  -- Autoformat
  -- help conform-formatters for available formatters
  -- https://github.com/stevearc/conform.nvim
  -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
  -- :ConformInfo
  {

    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofumpt', 'goimports' },
        sh = { 'shellcheck', 'shfmt' },
        -- Conform can also run multiple formatters sequentially
        python = { 'isort', 'black' },

        yaml = { 'yamlfmt' },
        -- Install https://github.com/fsouza/prettierd
        css = { 'prettierd' },
        typescript = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
        terraform = { 'terraform_fmt' },
      },
    },
  },

  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              -- require('luasnip.loaders.from_vscode').lazy_load()
              require('luasnip.loaders.from_vscode').lazy_load { exclude = { 'go' } }
              require('luasnip.loaders.from_vscode').load { paths = { './snippets' } }
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'default',

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        menu = { border = 'rounded' },
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = { implementation = 'lua' },

      -- Shows a signature help window while you type arguments for a function
      signature = {
        enabled = true,
        window = { border = 'rounded' },
      },
    },
  },

  -- snippet = {
  --   expand = function(args)
  --     luasnip.lsp_expand(args.body)
  --   end,
  -- },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },
  -- completion = { completeopt = 'menu,menuone,noinsert' },
  -- formatting = {
  --   format = require('lspkind').cmp_format {
  --     before = require('tailwind-tools.cmp').lspkind_format,
  --   },
  -- },
  --
  -- -- For an understanding of why these mappings were
  -- -- chosen, you will need to read `:help ins-completion`
  -- --
  -- -- No, but seriously. Please read `:help ins-completion`, it is really good!
  -- mapping = cmp.mapping.preset.insert {
  --   -- Select the [n]ext item
  --   ['<C-n>'] = cmp.mapping.select_next_item(),
  --   -- Select the [p]revious item
  --   ['<C-p>'] = cmp.mapping.select_prev_item(),
  --
  --   -- Scroll the documentation window [b]ack / [f]orward
  --   ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  --   ['<C-f>'] = cmp.mapping.scroll_docs(4),
  --
  --   -- Accept ([y]es) the completion.
  --   --  This will auto-import if your LSP supports it.
  --   --  This will expand snippets if the LSP sent a snippet.
  --   -- Problem with <CR> or <Tab> is that it can't distinguish selection vs newline insert
  --   -- Not sure why C-CR doesn't work
  --   -- ['<C-CR>'] = cmp.mapping.confirm { select = true },
  --   ['<C-y>'] = cmp.mapping.confirm { select = true },
  --   -- Selection must be distinct from character input
  --   -- ['<CR>'] = cmp.mapping.confirm { select = true },
  --
  --   -- Manually trigger a completion from nvim-cmp.
  --   --  Generally you don't need this, because nvim-cmp will display
  --   --  completions whenever it has completion options available.
  --   ['<C-Space>'] = cmp.mapping.complete {},
  --
  --   -- INFO: Important
  --   -- Think of <c-l> as moving to the right of your snippet expansion.
  --   --  So if you have a snippet that's like:
  --   --  function $name($args)
  --   --    $body
  --   --  end
  --   --
  --   -- <c-l> will move you to the right of each of the expansion locations.
  --   -- <c-h> is similar, except moving you backwards.
  --   ['<C-l>'] = cmp.mapping(function()
  --     if luasnip.expand_or_locally_jumpable() then
  --       luasnip.expand_or_jump()
  --     end
  --   end, { 'i', 's' }),
  --   ['<C-h>'] = cmp.mapping(function()
  --     if luasnip.locally_jumpable(-1) then
  --       luasnip.jump(-1)
  --     end
  --   end, { 'i', 's' }),
  --
  --   -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
  --   --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
  -- },
  -- -- NOTE: See cmp-config.preselect and *cmp-config.view.entries.selection_order*
  -- -- for how the preselect works
  -- -- NOTE: Nvim-cmp respects the LSP (Language Server Protocol) specification.
  -- -- The LSP spec defines the `preselect` feature for completion.
  -- --
  -- -- "None" option still preselects but selects the first one as desired
  -- preselect = cmp.PreselectMode.None,
  --
  -- sources = {
  --   { name = 'nvim_lsp', group_index = 2 },
  --   -- { name = 'copilot', group_index = 2 },
  --   { name = 'luasnip', group_index = 2 },
  --   -- { name = 'codeium', group_index = 2 },
  --   { name = 'path', group_index = 2 },
  -- },
  --
  -- -- Other examples
  -- -- https://github.com/xero/dotfiles/blob/a48855d2a06d0fecec85e02b72139e4e2b5fff6e/neovim/.config/nvim/lua/plugins/copilot.lua#L216
  -- -- https://github.com/xero/dotfiles/blob/a48855d2a06d0fecec85e02b72139e4e2b5fff6e/neovim/.config/nvim/lua/plugins/cmp.lua#L49
  -- -- -------------------------------------
  -- -- Codeium?
  -- -- https://github.com/ecosse3/nvim/blob/344706db1ad7c0cf7112714dd50eadc647fb81fc/lua/plugins/cmp.lua#L125
  -- sorting = {
  --   priority_weight = 2,
  --   comparators = {
  --     -- require('copilot_cmp.comparators').prioritize,
  --
  --     -- Below is the default comparitor list and order for nvim-cmp
  --     cmp.config.compare.offset,
  --     -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
  --     cmp.config.compare.exact,
  --     cmp.config.compare.score,
  --     cmp.config.compare.recently_used,
  --     cmp.config.compare.locality,
  --     cmp.config.compare.kind,
  --     cmp.config.compare.sort_text,
  --     cmp.config.compare.length,
  --     cmp.config.compare.order,
  --   },
  -- },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'onedark'
    end,
  },

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
      -- Supported languages
      -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'vim',
        'vimdoc',
        'tsx',
        'typescript',
        'css',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
      view = {
        signcolumn = 'auto',
        -- A table indicates that the view should be dynamically sized based on the longest
        -- line
        width = {
          -- set max just in case...
          max = 30,
        },
      },
    },
  },

  -- "cmp" already adds autopairs support. Do I really need this again
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {
      check_ts = true, -- use treesitter to check
    },
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
  },

  -- Golang support
  {
    -- Doc is go-nvim
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    keys = {
      -- <leader>c_ : langauge agnostic
      -- { '<leader>ct', '<cmd>GoTest -n -F<cr>', desc = '[C]ode [T]est' },
      { '<leader>ctd', '<cmd>GoTest -n -F -a -test.count=1<cr>', desc = '[C]ode [T]est [D]isable Cache' },

      -- { '<leader>ctv', '<cmd>GoTest -n -F -v<cr>', desc = '[C]ode [T]est [V]erbose' },
      -- { '<leader>cta', '<cmd>GoTest -F<cr>', desc = '[C]ode Test [A]ll' },
      -- { '<leader>ctp', '<cmd>GoTest -p -F<cr>', desc = '[C]ode Test Current [P]ackage' },
      -- { '<leader>cl', '<cmd>GoLint<cr>', desc = '[C]ode [L]int' },
      { '<leader>cd', '<cmd>GoDebug<cr>', desc = '[C]ode [D]ebug' },
      { '<leader>cds', '<cmd>GoDbgStop<cr>', desc = '[C]ode [D]ebug [S]top' },

      -- <leader>g_
      { '<leader>gf', '<cmd>GoFillStruct<cr>', desc = '[G]o [F]ill struct' },
      { '<leader>gc', '<cmd>GoTermClose<cr>', desc = '[G]o Term [C]lose' },
    },
    config = function()
      require('go').setup {
        -- Verbose writes log to $HOME/tmp/gonvim.log. Ideally it should write to
        -- $HOME/.cache/* like the other logs
        -- verbose = true,

        -- Write to floatterm. Setting it false writes to quickfix list which causes
        -- weired issue where :GoRun<cr> opens a command window and then another in quickfix list
        -- FIXME: floaterm and quickfix both are looking odd
        -- run_in_floaterm = true,
      }
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- smooth scroll
  {
    'karb94/neoscroll.nvim',
    config = function()
      -- Set mappings manually to override scroll duration.
      -- TODO: Plugin doesn't appear to provide a way to override only the duration.
      local neoscroll = require 'neoscroll'
      neoscroll.setup {
        mappings = {}, -- Do not set any mappings. It's set in the later step.
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
        easing = 'linear',
        pre_hook = nil,
        post_hook = nil,
        performance_mode = false,
      }
      -- Override mappings with custom duration.
      local mapping_funcs = {
        ['<C-u>'] = function()
          neoscroll.ctrl_u { duration = 80 }
        end,
        ['<C-d>'] = function()
          neoscroll.ctrl_d { duration = 80 }
        end,
      }
      local modes = { 'n', 'v', 'x' }
      for k, v in pairs(mapping_funcs) do
        vim.keymap.set(modes, k, v)
      end
    end,
  },

  -- status bar
  -- https://github.com/nvim-lualine/lualine.nvim
  {
    -- +-------------------------------------------------+
    -- | A | B | C                             X | Y | Z |
    -- +-------------------------------------------------+
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    -- config = function()
    --   ---@diagnostic disable-next-line: missing-parameter
    --   require('lualine').setup
    -- end,
    opts = {
      options = {
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '█', right = '█' },
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          {
            -- https://github.com/jdhao/nvim-config/blob/a602d9881982ec209218299bad200c98f53b2259/lua/config/lualine.lua#L206
            function()
              local msg = 'No Active Lsp'
              local buf_ft = vim.api.nvim_get_option_value('filetype', {})
              local clients = vim.lsp.get_clients { bufnr = 0 }
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
            'filename',
            path = 1, -- relative path
            shortening_target = 40, -- shortens to leave N chars for other components
          },
        },
      },
      extensions = { 'neo-tree', 'nvim-tree' },
    },
  },

  -- better diff view
  {
    'sindrets/diffview.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons' },
    },
    config = function()
      require('diffview').setup()
      -- FIXME: Get diffview working
      -- vim.keymap.set('n', '<leader>g', ':DiffviewOpen<CR>', { desc = 'Show diagnostic [E]rror messages' })
    end,
  },
  -- show lines around scope/indents
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        -- Issue: Nearest ident (i.e scope) and the rest are highlighted differently
        --
        -- Cursorline 21283b
        -- IblIndent also 21283b
        -- IblWhitespace 455574
        --
        --
        -- Issue: These two conflicts and make it unable to see comment parens
        -- MatchParen 455574
        -- Comment 455574
        --
        char = '│',
        tab_char = { '>' },
        -- highlight = { 'WarningMsg' },
      },
    },
  },

  -- Seamlessly use tmux navigation keys with nvim
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },

  -- Lazygit integration with vim
  -- Lazygit is installed outside of Neovim.
  -- Config is located ~/.config/lazygit/. :LazyGitConfig opens up the config file
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' ls recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>lg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1 -- fullscreen
      -- use plenary.nvim to manage floating window if available
      -- for some reason, gitlazy window border corrupts subsequent telescope borders
      vim.g.lazygit_floating_window_use_plenary = 0
      require('telescope').load_extension 'lazygit'
      -- code
    end,
  },

  -- Visualize undos
  {
    'mbbill/undotree',
    lazy = false,
    config = function()
      vim.g.undotree_SplitWidth = 40
      vim.g.undotree_DiffpanelHeight = 20
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },
  -- better folding
  -- Getting some error....
  -- Error in decoration provider ufo.end:
  -- Error executing lua: Keyboard interrupt
  -- stack traceback:
  --         [C]: in function 'error'
  --         ...ho/.local/share/nvim/lazy/nvim-ufo/lua/ufo/decorator.lua:143: in function <...ho/.local/share/nvim/lazy/nvim-ufo/lua/ufo/decorator.lua:140>
  --
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'neovim/nvim-lspconfig',
      'kevinhwang91/promise-async',
    },
    event = 'VeryLazy',
    opts = {},

    init = function()
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
    end,
    config = function()
      local ufo = require 'ufo'
      -- https://github.com/jdhao/nvim-config/blob/6e60475f3f956ee4b7a2a2deea47f44d9676ed9a/lua/config/nvim_ufo.lua
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local foldedLines = endLnum - lnum
        local suffix = (' 󰁂  %d'):format(foldedLines)
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
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        local rAlignAppndx = math.max(math.min(vim.opt.textwidth['_value'], width - 1) - curWidth - sufWidth, 0)
        suffix = (' '):rep(rAlignAppndx) .. suffix
        table.insert(newVirtText, { suffix, 'MoreMsg' })
        return newVirtText
      end
      ---@diagnostic disable-next-line: missing-fields
      ufo.setup {
        fold_virt_text_handler = handler,
      }
      vim.keymap.set('n', 'zR', ufo.openAllFolds)
      vim.keymap.set('n', 'zM', ufo.closeAllFolds)
    end,
  },

  -- Automatically close tags
  -- https://github.com/windwp/nvim-ts-autotag
  {
    'windwp/nvim-ts-autotag',
    opts = {
      opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
      -- Also override individual filetype configs, these take priority.
      -- Empty by default, useful if one of the "opts" global settings
      -- doesn't work well in a specific filetype
      -- per_filetype = {
      --   ['html'] = {
      --     enable_close = false,
      --   },
      -- },
    },
  },

  {
    'ahmedkhalf/project.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('project_nvim').setup {}
      require('telescope').load_extension 'projects'
    end,
    -- opts = {},
  },
  {
    -- Multi line cursor
    -- https://github.com/mg979/vim-visual-multi
    -- help: visual-multi
    'mg979/vim-visual-multi',
    -- init is where vim.g should be placed. Called on every plugin start
    init = function()
      vim.g.VM_leader = '<space>v'
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
  },

  {
    -- Line number column formatting.
    'luukvbaal/statuscol.nvim',
    config = function()
      local builtin = require 'statuscol.builtin'
      require('statuscol').setup {
        setopt = true,
        relculright = true, -- aligns the curr ln right

        -- segments = {
        --   { text = { '%C' }, click = 'v:lua.ScFa' },
        --   { text = { '%s' }, click = 'v:lua.ScSa' },
        --   {
        --     text = { builtin.lnumfunc, ' ' },
        --     condition = { true, builtin.not_empty },
        --     click = 'v:lua.ScLa',
        --   },
        -- },
      }
    end,
  },

  {
    -- Theme
    'navarasu/onedark.nvim',
    opts = {
      style = 'deep',
    },
  },

  {
    -- https://github.com/nvim-neotest/neotest
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      -- https://github.com/ecosse3/nvim/blob/344706db1ad7c0cf7112714dd50eadc647fb81fc/lua/plugins/testing.lua#L22
      'nvim-neotest/neotest-jest', -- Jest
      { 'fredrikaverpil/neotest-golang', version = '*' }, -- Golang: Installation
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-jest' {
            jestCommand = 'npm test --',
            env = { CI = true },
            cwd = function(path)
              return vim.fn.getcwd()
            end,
          },
          require 'neotest-golang', -- Golang Registration
          -- require 'neotest-golang' { runner = 'gotestsum' }, -- Golang Registration
        },
        diagnostic = {
          enabled = false,
        },
        highlights = {
          adapter_name = 'NeotestAdapterName',
          border = 'NeotestBorder',
          dir = 'NeotestDir',
          expand_marker = 'NeotestExpandMarker',
          failed = 'NeotestFailed',
          file = 'NeotestFile',
          focused = 'NeotestFocused',
          indent = 'NeotestIndent',
          namespace = 'NeotestNamespace',
          passed = 'NeotestPassed',
          running = 'NeotestRunning',
          skipped = 'NeotestSkipped',
          test = 'NeotestTest',
        },
        floating = {
          border = 'rounded',
          max_height = 0.6,
          max_width = 0.6,
          options = {
            wrap = true,
          },
        },
        icons = {
          child_indent = '│',
          child_prefix = '├',
          collapsed = '─',
          expanded = '╮',
          failed = '✖',
          final_child_indent = ' ',
          final_child_prefix = '╰',
          non_collapsible = '─',
          passed = '✔',
          running = '',
          unknown = '?',
        },
        output = {
          enabled = true,
          open_on_run = true,
        },
        output_panel = {
          enabled = true,
          open = 'botright split | resize 15',
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
        summary = {
          enabled = true,
          expand_errors = true,
          follow = true,
          mappings = {
            attach = 'a',
            expand = { '<CR>', '<2-LeftMouse>' },
            expand_all = 'e',
            jumpto = 'i',
            output = 'o',
            run = 'r',
            short = 'O',
            stop = 'u',
          },
        },
      }
    end,
  },
  {
    -- https://github.com/luckasRanarison/tailwind-tools.nvim
    'luckas Ranarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
