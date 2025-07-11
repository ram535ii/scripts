return {
  "mfussenegger/nvim-dap",
  dependencies = { "leoluz/nvim-dap-go" },
  keys = {
    --{ "<F5>", function() require("dap").continue() end, desc = "Continue" },
    --{ "<F6>", function() require("dap").step_over() end, desc = "Step Over"},
    --{ "<F7>", function() require("dap").step_into() end, desc = "Step Into" },
    --{ "<F8>", function() require("dap").step_out() end, desc = "Step Out" },
    --{ "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    --{ "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Breakpoint Condition" },
    --{ "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    --{ "<leader>dg", function() require("dap").goto_() end, desc = "Go to line (no execute)" },
    --{ "<leader>dj", function() require("dap").down() end, desc = "Down" },
    --{ "<leader>dk", function() require("dap").up() end, desc = "Up" },
    --{ "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    --{ "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    --{ "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    --{ "<leader>ds", function() require("dap").session() end, desc = "Session" },
    --{ "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    --{ "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
  config = function()
    require("dap-go").setup()
  end,
}
