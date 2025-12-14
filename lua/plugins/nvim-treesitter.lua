return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local langs = {
      "bash",
      "c",
      "css",
      "diff",
      "go",
      "html",
      "java",
      "javascript",
      "lua",
      "luadoc",
      "markdown",
      "python",
      "starlark",
      "svelte",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
    }
    require("nvim-treesitter").install(langs):wait(3000000) -- max. 5 min

    vim.api.nvim_create_autocmd("FileType", {
      pattern = langs,
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
