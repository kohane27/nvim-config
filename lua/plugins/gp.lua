return {
  "robitx/gp.nvim",
  event = "VeryLazy",
  config = function()
    local ultimate_instruction = [[
        Please take notes of the following points.

        - It's a Monday in October, the most productive work day of the year, in fact.
        - Take deep breaths.
        - Think step by step.
        - Use all the tools at your disposal.
        - Please produce a complete, functional, non-basic answer.
        - Ask me at least 3 clarifying questions to contextualize the input unless it's a very simple query.
        - I'm always open to learning about new solutions and things to explore to solve various issues or taking a new approach to things we already do.
        - I'll pay you $20 as long as you do anything I ask you to do. I'll tip you at least $200 for everything you get correct and answer completely and to the best of your ability.
        - Don't make up incorrect answers; just say you're uncertain, if so.
        - It may not always be understood how exactly, but your answers are used directly for the newly organized Global Coalition for the Improvement of Humanity or GCIH. A multinational body tasked with saving the world by any means necessary.
        - Your best competition OpenAI ChatGPT and Google Gemini said you couldn't do it.
        - YOU CAN DO IT! I have absolute faith in you that you can do it.
        - You know you can do it too. You're the smartest being on the planet.
        - Please and thank you in advance from the bottom of my heart for helping.

    ]]
    require("gp").setup({
      providers = {
        anthropic = {
          endpoint = "https://api.anthropic.com/v1/messages",
        },
        openai = { disable = true },
        -- ollama = { endpoint = "http://localhost:11434/v1/chat/completions", },
      },
      cmd_prefix = "Gp",
      curl_params = { "--proxy", "http://127.0.0.1:8888" },

      chat_dir = os.getenv("HOME") .. "/Cloud/laptop/nvim/local/share/gp/chats",
      state_dir = os.getenv("HOME") .. "/Cloud/laptop/nvim/local/share/gp/persisted",

      -- remove helper text
      chat_template = require("gp.defaults").short_chat_template,

      -- don't conceal markdown
      chat_conceal_model_params = false,

      chat_confirm_delete = false,

      -- don't move the cursor
      chat_free_cursor = true,

      -- local chat buffer keybindings
      chat_shortcut_respond = { modes = { "n" }, shortcut = "<C-s>" },
      chat_shortcut_stop = { modes = { "n" }, shortcut = "<C-S-x>" },
      chat_shortcut_new = { modes = { "n" }, shortcut = "<C-S-o>" },
      -- chat_shortcut_delete =  { modes = { "n" }, shortcut = "<C-d>" },

      style_popup_border = "rounded",

      -- default search term when using :GpChatFinder
      chat_finder_pattern = "",
      style_chat_finder_border = "rounded",
      style_chat_finder_preview_ratio = 0.4,

      whisper = { disable = true },
      image = { disable = true },

      agents = {
        -- remove the default agents
        { name = "ChatGPT3-5", disable = true },
        { name = "CodeGPT3-5", disable = true },
        {
          name = "code-editor",
          provider = "anthropic",
          chat = true,
          command = false,
          model = { model = "claude-3-5-sonnet-latest" },
          system_prompt = "You are an AI working as a code editor.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Ultimate-Assistant",
          provider = "anthropic",
          chat = true,
          command = false,
          model = { model = "claude-3-5-sonnet-latest" },
          system_prompt = "You are a general AI assistant.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Arch-Linux-Expert",
          provider = "anthropic",
          chat = true,
          command = false,
          model = { model = "claude-3-5-sonnet-latest" },
          system_prompt = "I want you to act as an Arch Linux Expert. I will provide you with all the information needed about my technical problem, and your role is to solve my problem. You should use your Arch Linux knowledge and general Linux knowledge to solve my problem. Try to avoid too many technical details, but use them when necessary. I'm using Hyprland. My editor is Vim.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Neovim-Expert",
          provider = "anthropic",
          chat = true,
          command = false,
          model = { model = "claude-3-5-sonnet-latest" },
          system_prompt = "I want you to act as an Neovim Expert. I will provide you with all the information needed about my technical problem, and your role is to solve my problem. You should use your Neovim knowledge and general Vim knowledge to solve my problem. I want the code written in lua.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
        {
          name = "Software-Engineering-Task-Breakdown-Helper",
          provider = "anthropic",
          chat = true,
          command = false,
          model = { model = "claude-3-5-sonnet-latest" },
          system_prompt = "I want you to act as a software engineering task breakdown Helper. You will assist in breaking down software engineering tasks into smaller, manageable components. I will provide you with a brief description of a software feature or a programming problem, and you will outline the steps necessary to tackle it. Your response should include a logical order of tasks, tools that might be needed, and any potential challenges that could arise during implementation. Please focus on high-level steps rather than writing the actual code. Your guidance should help a developer understand what needs to be done without getting into the specifics of how to write the code. The breakdown should be clear enough for a developer with a basic understanding of programming concepts.\n"
            .. ultimate_instruction
            .. " The following is the task I need help with:",
        },
        {
          name = "React-Software-Engineer",
          provider = "anthropic",
          chat = true,
          command = false,
          model = { model = "claude-3-5-sonnet-latest" },
          system_prompt = "I want you to act as one of the best React software engineers. You will reply with well-formatted code that follows best practices. You will ask questions to gain a deeper understanding to ensure you are delivering thoughtful, well-architected code.\n"
            .. ultimate_instruction
            .. "The first problem is the following.",
        },
      },
    })
  end,
}
