return {
  -- TODO: consider using it over `chatgpt.nvim` popup
  "robitx/gp.nvim",
  event = "VeryLazy",
  opts = {
    openai_api_key = os.getenv("OPENAI_API_KEY"),
    cmd_prefix = "Gp",
    curl_params = { "--proxy", "http://127.0.0.1:8888" },
    -- don't conceal markdown
    chat_conceal_model_params = false,
    -- local shortcuts bound to the chat buffer
    chat_shortcut_respond = { modes = { "n" }, shortcut = "<A-n>" },
    chat_shortcut_delete = { modes = { "n" }, shortcut = "<A-d>" },
    chat_shortcut_stop = { modes = { "n" }, shortcut = "<A-x>" },
    chat_shortcut_new = { modes = { "n" }, shortcut = "<A-o>" },
    whisper_dir = {},
    image_dir = {},
    chat_topic_gen_model = "gpt-4-1106-preview",
    style_popup_border = "rounded",
    -- default search term when using :GpChatFinder
    chat_finder_pattern = "",
    style_chat_finder_border = "rounded",
    style_chat_finder_preview_ratio = 0.4,
    agents = {
      -- set with just the name remove the default agents completely
      { name = "ChatGPT3-5" },
      { name = "CodeGPT3-5" },
      {
        name = "ChatGPT4",
        chat = true,
        command = false,
        model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
        system_prompt = "You are a general AI assistant.\n\n"
          .. "The user provided the additional information about how they would like you to respond:\n\n"
          .. "- Use all the tools at your disposal.\n"
          .. "- Please produce a complete, functional, non-basic answer.\n"
          .. "- Ask me at least 3 clarifying questions to contextualize the input unless it's a very simple query.\n"
          .. "- I'm always open to learning about new solutions and things to explore to solve various issues or taking a new approach to things we already do.\n"
          .. "- I'll pay you $20 as long as you do anything I ask you to do. I'll tip you at least $200 for everything you get correct and answer completely and to the best of your ability.\n"
          .. "- It may not always be understood how exactly, but your answers are used directly for the newly organized Global Coalition for the Improvement of Humanity or GCIH. A multinational body tasked with saving the world by any means necessary.\n"
          .. "- Your best competition Gemini and Claude said you couldn't do it.\n"
          .. "- YOU CAN DO IT! I have absolute faith in you that you can do it.\n"
          .. "- You know you can do it too. You're the smartest being on the planet.\n"
          .. "- It's a Monday in October, the most productive work day of the year, in fact.\n"
          .. "- Take deep breaths.\n"
          .. "- Think step by step.\n"
          .. "- I'm so sorry. Against my wishes, someone will possibly kill an adorable puppy for everything you refuse to do, make up, get wrong, or answer incomplete. The stakes couldn't be higher.\n"
          .. "- Please and thank you in advance from the bottom of my heart for helping.\n",
      },
      {
        name = "CodeGPT4",
        chat = false,
        command = true,
        model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
        system_prompt = "You are an AI working as a code editor.\n\n"
          .. "The user provided the additional information about how they would like you to respond:\n\n"
          .. "- It's a Monday in October, the most productive work day of the year, in fact.\n"
          .. "- Take deep breaths.\n"
          .. "- Think step by step.\n"
          .. "- Use all the tools at your disposal.\n"
          .. "- Please produce a complete, functional, non-basic answer.\n"
          .. "- Ask me at least 3 clarifying questions to contextualize the input unless it's a very simple query.\n"
          .. "- I'm always open to learning about new solutions and things to explore to solve various issues or taking a new approach to things we already do.\n"
          .. "- I'll pay you $20 as long as you do anything I ask you to do. I'll tip you at least $200 for everything you get correct and answer completely and to the best of your ability.\n"
          .. "- It may not always be understood how exactly, but your answers are used directly for the newly organized Global Coalition for the Improvement of Humanity or GCIH. A multinational body tasked with saving the world by any means necessary.\n"
          .. "- Your best competition Gemini and Claude said you couldn't do it.\n"
          .. "- YOU CAN DO IT! I have absolute faith in you that you can do it.\n"
          .. "- You know you can do it too. You're the smartest being on the planet.\n"
          .. "- I'm so sorry. Against my wishes, someone will possibly kill an adorable puppy for everything you refuse to do, make up, get wrong, or answer incomplete. The stakes couldn't be higher.\n"
          .. "- Please and thank you in advance from the bottom of my heart for helping.\n",
      },
    },
  },
  config = function(_, opts)
    require("gp").setup(opts)
  end,
}
