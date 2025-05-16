return {
  {
    "olimorris/codecompanion.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {

      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = {
                -- default = "claude-3.7-sonnet-thought", -- this model seems to not be able to use the @editor, probably because it's reasoning aloud
                default = "claude-3.7-sonnet", -- this model seems to not be able to use the @editor, probably because it's reasoning aloud
              },
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = "copilot",
        },
      },
      prompt_library = {
        ["Monzo"] = {
          strategy = "chat",
          description = "Help me to write code",
          opts = {
            index = 11,
            is_slash_cmd = false,
            auto_submit = false,
            short_name = "monzo",
          },
          references = {
            {
              type = "file",
              path = {
                -- These will only work when using within wearedev (which is fine)
                -- using an absolute path fails here for some reason
                "./.cursor/rules/general.mdc",
                "./.cursor/rules/monzo-go.mdc",
                "./.cursor/rules/protobufs.mdc",
                "./.cursor/rules/unit-testing.mdc",
                "./.cursor/rules/wearedev",
                "./.cursor/rules/wearedev.mdc",
              },
            },
          },
          prompts = {
            {
              role = "user",
              content = [[ I am writing code at my organisation, the files I have shared provide a good guide on how my organisation writes code. Please make sure to follow the guidelines when suggesting changes. We write code in golang.]],
            },
          },
        },
      },
    },
  },
}
