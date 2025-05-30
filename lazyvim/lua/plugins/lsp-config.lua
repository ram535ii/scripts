local lspconfig = require("lspconfig")
local path = require("plenary.path")

local servers = {
  "gopls",
  "protols",
}

for _, lsp in ipairs(servers) do
  vim.lsp.enable(lsp)
end

-- Automatically open LSP-powered autocompletion.
local setup_completion = function(client, bufnr)
  if client:supports_method("textDocument/completion") then
    vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end
end

local custom_lsp_attach = function(setup_callbacks)
  return function(client, bufnr)
    for _, setup_function in ipairs(setup_callbacks) do
      setup_function(client, bufnr)
    end
  end
end

local function service_root_dir(bufnr, cb)
  local buffer_filepath = vim.api.nvim_buf_get_name(bufnr)
  -- Treat anything containing these files as a root directory. This
  -- prevents us ascending too far toward the root of the repository, which
  -- stops us from trying to ingest too much code.
  local root_markers = { "main.go", "README.md", "go.mod", "LICENSE" } -- Add more as needed
  local root_directory = lspconfig.util.root_pattern(root_markers)(buffer_filepath)
  cb(root_directory)
end

return {
  {
    dir = "~",
    enabled = path:new(os.getenv("HOME") .. "/src/github.com/monzo/wearedev"):exists(),
    config = function()
      vim.lsp.config("gopls", {
        -- TODO(ram535ii): do I need this in a LazyVim world?
        -- on_attach = custom_lsp_attach{ -- by default, set up everything!
        -- setup_completion
        -- },

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

        root_dir = service_root_dir,
        filetypes = { "go", "yml" },

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
      })

      vim.lsp.config("protols", {
        root_dir = service_root_dir,
      })
    end,
  },
}
