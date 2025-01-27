return {
  "olimorris/codecompanion.nvim",
  dependencies = { "stevearc/dressing.nvim" },
  config = function()
    require("codecompanion").setup({
      display = {
        chat = {
          show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
          show_references = true, -- Show references (from slash commands and variables) in the chat buffer?
          show_settings = true, -- Show LLM settings at the top of the chat buffer?
          show_token_count = true, -- Show the token count for each response?
        },
      },
      strategies = { chat = { adapter = "openrouter" } },
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
                default = "deepseek/deepseek-r1",
              },
            },
          })
        end,
      },
      keymaps = {
        ["<C-n>"] = "keymaps.save", -- Save the chat buffer and trigger the LLM
        ["<C-x>"] = "keymaps.cancel_request",
        ["gc"] = "keymaps.clear", -- Clear the contents of the chat
        ["ga"] = "keymaps.codeblock", -- Insert a codeblock into the chat
        ["gs"] = "keymaps.save_chat", -- Save the current chat
        ["gt"] = "keymaps.add_tool", -- Add a tool to the current chat buffer
        ["]"] = "keymaps.next", -- Move to the next header in the chat
        ["["] = "keymaps.previous", -- Move to the previous header in the chat
      },
    })
  end,
}
