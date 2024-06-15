return {
  "olimorris/codecompanion.nvim",
  dependencies = { "stevearc/dressing.nvim" },
  config = function()
    require("codecompanion").setup({
      adapters = {
        ollama = require("codecompanion.adapters").use("ollama", {
          schema = {
            model = {
              default = "llama3",
            },
          },
        }),
      },
      strategies = {
        chat = "ollama",
        inline = "ollama",
        tools = "ollama",
      },
      saved_chats = {
        save_dir = vim.fn.stdpath("data") .. "/codecompanion/saved_chats",
      },
      display = {
        chat = {
          window = {
            layout = "vertical",
            height = 0.8,
            width = 0.45,
            relative = "editor",
          },
          show_settings = true,
          show_token_count = false,
        },
      },
      keymaps = {
        ["<C-s>"] = "keymaps.save", -- Save the chat buffer and trigger the LLM
        ["<C-c>"] = "keymaps.close", -- Close the chat buffer
        ["q"] = "keymaps.cancel_request", -- Cancel the currently streaming request
        ["gc"] = "keymaps.clear", -- Clear the contents of the chat
        ["ga"] = "keymaps.codeblock", -- Insert a codeblock into the chat
        ["gs"] = "keymaps.save_chat", -- Save the current chat
        ["gt"] = "keymaps.add_tool", -- Add a tool to the current chat buffer
        ["]"] = "keymaps.next", -- Move to the next header in the chat
        ["["] = "keymaps.previous", -- Move to the previous header in the chat
      },
      log_level = "ERROR", -- TRACE|DEBUG|ERROR
      send_code = true, -- Send code context to the LLM? Disable to prevent leaking code outside of Neovim
      silence_notifications = false, -- Silence notifications for actions like saving saving chats?
      use_default_actions = true, -- Use the default actions in the action palette?
    })
  end,
}
