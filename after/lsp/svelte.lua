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
        -- Eslint conflicts. E.g) unused var warning
        typescript = {
          enable = false,
        },
      },
    },
  },
}
