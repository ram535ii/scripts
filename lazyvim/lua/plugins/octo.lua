return {
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    event = { { event = "BufReadCmd", pattern = "octo://*" } },
    opts = {
      -- or "fzf-lua" or "snacks" or "default"
      picker = "telescope",
      -- bare Octo command opens picker of commands
      enable_builtin = true,
      -- Use the local file on the right so gopls can be used to navigate.
      use_local_fs = true,
    },
    keys = {
      {
        "<leader>op",
        "<CMD>Octo pr list<CR>",
        desc = "List all PRs",
      },
      {
        "<leader>om",
        "<CMD>Octo search is:pr is:open author:@me<CR>",
        desc = "List my PRs",
      },
      {
        "<leader>orc",
        "<CMD>Octo comment add<CR>",
        desc = "Add a PR comment",
      },
      {
        "<leader>ors",
        "<CMD>Octo review submit<CR>",
        desc = "Submit a review",
      },
      {
        "<leader>os",
        function()
          require("octo.utils").create_base_search_command({ include_current_repo = true })
        end,
        desc = "Search GitHub",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR "ibhagwan/fzf-lua",
      -- OR "folke/snacks.nvim",
      "nvim-tree/nvim-web-devicons", -- optional if file_panel.icons is a function
    },
  },
}
