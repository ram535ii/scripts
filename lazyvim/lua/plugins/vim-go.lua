return {
  {
    "fatih/vim-go",
    make = ":GoInstallBinaries",
    config = function()
      vim.g.go_gopls_enabled = false -- or false to disable
      vim.g.go_def_mapping_enabled = false -- stops vim-go taking over <C-t> for tagstack jumps

      -- Nice syntax highlighting
      vim.g.go_highlight_types = true
      vim.g.go_highlight_fields = true
      vim.g.go_highlight_functions = true
      vim.g.go_highlight_function_calls = true
      vim.g.go_highlight_methods = true
      vim.g.go_highlight_operators = true
      vim.g.go_highlight_extra_types = true
      vim.g.go_highlight_format_strings = true

      vim.keymap.set("n", "<leader>ce", "<cmd>GoIfErr<CR>", { desc = "Go if error" })
      vim.keymap.set("n", "<leader>ctf", "<cmd>GoAlternate<CR>", { desc = "Go to tests for file" }) -- code-test-alternate
      vim.keymap.set("n", "<leader>ta", "<cmd>GoAlternate<CR>", { desc = "Go to tests for file" }) -- code-test-alternate
      vim.keymap.set("n", "<leader>ctc", "<cmd>GoCoverageToggle<CR>", { desc = "Test coverage toggle" }) -- code-test-coverage
      vim.keymap.set("n", "<leader>cB", function()
        local filename = vim.fn.expand("%:t")
        if string.match(filename, "_test%.go$") then
          vim.cmd("GoTestCompile")
        elseif string.match(filename, "%.go$") then
          vim.cmd("GoBuild")
        end
      end, { desc = "Go build or test compile" })
    end,
  },

  -- for navigating to proto definitions
  {
    "delabere/protodef",
    config = function()
      vim.keymap.set(
        "n",
        "<leader>cp", -- code+protobuf
        require("protodef").protodef,
        { noremap = true, silent = true, desc = "ProtoDefinition" }
      )
    end,
  },
}
