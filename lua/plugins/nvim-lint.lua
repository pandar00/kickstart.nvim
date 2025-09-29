return {
  "mfussenegger/nvim-lint",
  ft = "java",
  config = function()
    local nvimlint = require("lint")
    nvimlint.linters_by_ft = {
      -- Linting is typically done by "conformer" plugin but Java...
      java = { "checkstyle" },
    }
    -- nvimlint.linters.checkstyle.args = {
    --   "-c",
    --   "/Users/hcho4/Programming/git/igloo/tools/checkstyle/checkstyle.xml",
    -- }

    -- TODO: need a way to configure this per project
    require("lint.linters.checkstyle").config_file = "/Users/hcho4/Programming/git/igloo/tools/checkstyle/checkstyle.xml"
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        -- try_lint without arguments runs the linters defined in `linters_by_ft`
        -- for the current filetype
        require("lint").try_lint()
      end,
    })
  end,
}
