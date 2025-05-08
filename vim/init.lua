vim.notify("Welcome to your ridiculously bespoke neovim setup 😎", vim.log.levels.INFO)

-- Source all my original vimscript.
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/legacy-init.vim')


require'lspconfig'.gopls.setup{
  -- Run gopls with Go modules disabled.
  cmd = { "env", "GO111MODULE=off", "gopls", "-remote=auto" },

  settings = {
    gopls = {
      analyses = {
        -- These are the only analyzers that are disabled by default in
        -- gopls.
        nilness = true,
        shadow = true,
        unusedparams = true,
        unusedwrite = true,
      },
      buildFlags = { "-tags=integration" }, -- for LSP support in integration tests
      staticcheck = true,
      expandWorkspaceToModule = false,
      -- Organize imports. Groups imports by Monzo versus not-Monzo.
      -- Equivalent to local flag with goimports
      ["local"] = "github.com/monzo/wearedev",
    },
  },

  -- Treat anything containing these files as a root directory. This
  -- prevents us ascending too far toward the root of the repository, which
  -- stops us from trying to ingest too much code.
  root_dir = function(startpath)
    local root_markers = {"README.md", "main.go", "go.mod", "LICENSE", ".git"}
    local matches = vim.fs.find(root_markers, {
      path = startpath,
      upward = true,
      limit = 1,
    })

    -- If there are no matches, fall back to finding the Git ancestor.
    if #matches == 0 then
      return lspconfig.util.find_git_ancestor(startpath)
    end

    local root_dir = vim.fn.fnamemodify(matches[1], ':p:h')
    return root_dir
  end,

  -- Never use wearedev as a root path. It'll grind your machine to a halt.
  ignoredRootPaths = { "$HOME/src/github.com/monzo/wearedev/" },

  -- Collect less information about packages without open files.
  memoryMode = "DegradeClosed",

  flags = {
    -- gopls is a particularly slow language server, especially in wearedev.
    -- Debounce text changes so that we don't send loads of updates.
    debounce_text_changes = 500,
  },

  init_options = {
    codelenses = {
      generate = true,
      gc_details = true,
      test = true,
	      tidy = true,
    },
  },
}

-- Keymaps.
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename' })
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = 'Signature help' })
vim.keymap.set('n', 'gref', '<cmd>lua vim.lsp.buf.references()<CR>', { desc = 'References' })
vim.keymap.set('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Hover' })
