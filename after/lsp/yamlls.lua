-- Yaml
-- Because yaml is used by many program as config file format, "schemaStore"
-- contains commonly used yaml schemas.
-- Schema store https://www.schemastore.org/json/
-- https://github.com/redhat-developer/yaml-language-server
return {
  settings = {
    yaml = {
      -- NOTE: in rare cases, it may load incorrect schema becuase the mapping is
      -- defined by file path pattern.
      --
      -- schemaStore = {
      --   enable = false,
      -- },
      -- schemas = {
      --   ['https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json'] = 'k8s.yaml',
      --   ['/path/from/root/of/project'] = '/.github/workflows/*',
      -- },
    },
  },
}
