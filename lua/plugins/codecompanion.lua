return {
  "olimorris/codecompanion.nvim",
  dependencies = { "stevearc/dressing.nvim" },
  config = function()
    require("codecompanion").setup({
      display = {
        chat = {
          show_header_separator = false,
          show_references = true,
          show_settings = true,
          show_token_count = false,
        },
      },
      strategies = { chat = { adapter = "openrouter" } },
      opts = { log_level = "TRACE" },
      adapters = {
        opts = {
          allow_insecure = false,
          proxy = "http://127.0.0.1:8888",
        },
        openrouter = function()
          return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
              url = "https://openrouter.ai/api",
              api_key = "OPENROUTER_API_KEY",
              chat_url = "/v1/chat/completions",
            },
            schema = {
              model = {
                -- default = "liquid/lfm-3b",
                default = "deepseek/deepseek-r1",
              },
            },
          })
        end,
      },
      keymaps = {
        ["<C-s>"] = "keymaps.save", -- Save the chat buffer and trigger the LLM
        ["<C-x>"] = "keymaps.cancel_request",
        ["gc"] = "keymaps.clear", -- Clear the contents of the chat
        ["ga"] = "keymaps.codeblock", -- Insert a codeblock into the chat
        ["gs"] = "keymaps.save_chat", -- Save the current chat
        ["gt"] = "keymaps.add_tool", -- Add a tool to the current chat buffer
      },
    })
  end,
}
