return {
  {
    "fatih/vim-go",
    make = ":GoInstallBinaries",
    config = function()
      vim.g.go_gopls_enabled = false -- or false to disable
      vim.g.go_def_mapping_enabled = false -- stops vim-go taking over <C-t> for tagstack jumps
      vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", { desc = "Go if error" })
      vim.keymap.set("n", "<leader>tf", "<cmd>GoAlternate<CR>", { desc = "Go to tests for file" })
      vim.keymap.set("n", "<leader>tc", "<cmd>GoCoverageToggle<CR>", { desc = "Test coverage toggle" })
    end,
  },

  -- for navigating to proto definitions
  { "delabere/protodef" },
}
