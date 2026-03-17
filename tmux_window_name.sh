autoload -U add-zsh-hook

tmux_update_window_name() {
  # Exit early if not inside tmux
  [[ -z "$TMUX" ]] && return

  local repo_root
  repo_root=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ -z "$repo_root" ]]; then
    # Not a git repo — use directory basename
    tmux rename-window "$(basename "$PWD")"
    return
  fi

  local repo_name
  repo_name=$(basename "$repo_root")

  local git_path="$repo_root/.git"
  if [[ -f "$git_path" ]]; then
    # .git is a file → this is a worktree
    # Parse the gitdir line to find the main repo name
    local gitdir_line
    gitdir_line=$(head -1 "$git_path")
    # gitdir line looks like: gitdir: /path/to/main-repo/.git/worktrees/name
    local main_repo_git="${gitdir_line#gitdir: }"
    # Strip /worktrees/<name> to get main .git dir, then get parent basename
    local main_repo_path="${main_repo_git%/.git/worktrees/*}"
    local main_repo_name
    main_repo_name=$(basename "$main_repo_path")
    local worktree_name
    worktree_name=$(basename "$repo_root")
    tmux rename-window "$main_repo_name: $worktree_name"
  else
    # .git is a directory → main checkout
    tmux rename-window "$repo_name: main"
  fi
}

add-zsh-hook chpwd tmux_update_window_name

# Run once immediately so new windows get named on creation
tmux_update_window_name
