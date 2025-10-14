return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- Disable inline blame text (avoids running `git blame` on every cursor move.
      current_line_blame = false,

      -- Don’t attach to untracked files (prevents extra `git status` calls).
      attach_to_untracked = false,

      -- Control how Gitsigns watches the .git directory.
      watch_gitdir = {
        enable = true, -- Keep watching for repo changes
        interval = 1000, -- Check every 1000ms (1s) instead of constantly
        follow_files = true, -- Keep tracking signs if files are renamed/moved
      },
    },
  },
}
