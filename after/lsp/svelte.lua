return {
  -- cmd = { ... },
  -- filetypes = { ... },
  -- capabilities = {},
  -- ↓ svelte.plugin.typescript.enable                                default: true
  settings = {
    -- NOTE: appears to not have any effect
    -- autoFixOnSave = true,
    svelte = {
      plugin = {
        svelte = {
          defaultScriptLanguage = "ts",
        },
        -- Note: Disabling it appears to disable linting TS in the svelte template
        -- typescript = {
        --   enable = false,
        -- },
      },
    },
  },
}
