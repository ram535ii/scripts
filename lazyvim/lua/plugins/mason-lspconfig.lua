return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    -- Currently unclear if this is actually working. I've just uninstalled
    -- gopls via Mason.
    automatic_enable = {
      exclude = {
        "gopls", -- Use my LSP instead.
      },
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
