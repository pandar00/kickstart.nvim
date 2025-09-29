-- classpath does not work properly. kept is as a record
return {
  "nvim-java/nvim-java",
  opts = {
    -- spring_boot_tools = {
    --   enable = enable,
    --   version = "1.55.1",
    -- },

    jdtls = {
      version = "v1.44.0",
    },
    mason = {
      -- These mason registries will be prepended to the existing mason
      -- configuration
      registries = {
        "github:mason-org/mason-registry",
        "github:nvim-java/mason-registry",
      },
    },
  },
  config = function()
    require("java").setup()
    require("lspconfig").jdtls.setup({
      -- on_attach = require("plugins.lsp.opts").on_attach,
      -- capabilities = require("plugins.lsp.opts").capabilities,
      -- settings = {
      --   java = {
      --     configuration = {
      --       runtimes = {
      --         {
      --           name = "JavaSE-11",
      --           path = "/opt/homebrew/Cellar/openjdk@11/11.0.28/libexec/openjdk.jdk/Contents/Home",
      --           default = true,
      --         },
      --         {
      --           name = "JavaSE-17",
      --           path = "/opt/homebrew/Cellar/openjdk@17/17.0.16/",
      --         },
      --         {
      --           name = "JavaSE-21",
      --           path = "/opt/homebrew/Cellar/openjdk@21/21.0.8/",
      --         },
      --       },
      --     },
      --   },
      -- },
    })
  end,
}
