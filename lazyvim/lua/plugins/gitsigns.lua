--return {
--{ "lewis6991/gitsigns.nvim", enabled = false },
--}

return {
  {
    "lewis6991/gitsigns.nvim",
    enabled = true,
    opts = {
      --Disable inline blame text (avoids running `git blame` on every cursor move.
      current_line_blame = false,

      --Don’t attach to untracked files (prevents extra `git status` calls).
      attach_to_untracked = false,

      -- Delay refresh to reduce job spam.
      update_debounce = 1000,

      --Control how Gitsigns watches the .git directory.
      --watch_gitdir = {
      --enable = true, -- Keep watching for repo changes
      --interval = 10000, -- Check every 10s instead of constantly
      --follow_files = true, -- Keep tracking signs if files are renamed/moved
      --},
      -- Don't monitor .git in the background at all. If a buffer that is
      -- visible is changed in the background, I need to manually refresh to see
      -- the signs update.
      watch_gitdir = { enable = false },
    },
    keys = {
      -- "Experimental" commands.
      { "<leader>gxu", "<cmd>lua require('gitsigns').refresh()<cr>", desc = "Gitsigns refresh" },
      { "<leader>gxb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
    },
  },
}
