return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = true,
              },
              schemas = {
                [vim.fn.expand("~") .. "/src/github.com/monzo/wearedev/libraries/cassandra/schema/schema.bundled.generated.json"] = "*/config/schema.yml",
              },
            },
          },
        },
      },
    },
  },
}
