return {
  "olimorris/codecompanion.nvim",
  dependencies = { "stevearc/dressing.nvim" },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "openrouter",
          keymaps = {
            send = { modes = { n = "<C-s>" } },
            clear = { modes = { n = "gXX" } },
          },
        },
      },
      opts = { log_level = "ERROR", send_code = true },
      adapters = {
        http = {
          opts = { show_defaults = false, proxy = "http://127.0.0.1:8888" },
          openrouter = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
              env = {
                url = "https://openrouter.ai/api",
                api_key = "OPENROUTER_API_KEY",
                chat_url = "/v1/chat/completions",
              },
              schema = { model = { default = "openai/gpt-5" } },
            })
          end,
        },
      },
      display = {
        action_palette = {
          provider = "telescope",
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
        chat = {
          intro_message = "",
          show_settings = false,
          auto_scroll = false,
          window = {
            opts = {
              cursorline = true,
            },
          },
        },
        diff = {
          enabled = true,
          close_chat_at = 0, -- never close chat buffer
        },
      },
    })
  end,
}
