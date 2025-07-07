return {
  "nvim-neotest/neotest",
  dependencies = { "nvim-neotest/neotest-go" },
  config = function()
    -- get neotest namespace (api call creates or returns namespace)
    local neotest_ns = vim.api.nvim_create_namespace("neotest")
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)

    local go_adapter = require("neotest-go")({
      experimental = {
        test_table = true,
      },
      args = { "-count=1", "-timeout=60s" },
    })

    go_adapter.root = function()
      local this_file_directory = vim.fn.fnamemodify(vim.fn.expand("%"), ":p:h")
      print("setting go adapter root", this_file_directory)
      return this_file_directory
    end

    require("neotest").setup({
      discovery = {
        filter_dir = function(name, rel_path, root)
          print("name: ", name, "rel_path", rel_path, "root", root)
          if root == "/Users/constantijn/src/github.com/monzo/wearedev" then
            return false
          end
          return true
        end,
      },
      adapters = {
        go_adapter,
      },
    })
  end,
}
