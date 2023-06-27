local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  print("chatgpt not working")
end

chatgpt.setup({
  edit_with_instructions = {
    keymaps = {
      close = "<A-c>",
      accept = "<C-y>",
      toggle_settings = "<Space>?",
      cycle_windows = "<A-l>",
    },
  },
  chat = {
    keymaps = {
      close = "<A-c>",
      new_session = "<C-w>n",
      cycle_windows = "<A-l>",
      -- cycle_windows = "<C-w><Space>",
      rename_session = "<Space>rn",
      delete_session = "D",
      toggle_settings = "<Space>?",
    },
  },
  popup_layout = {
    default = "center",
    center = {
      width = "90%",
      height = "90%",
    },
    right = {
      width = "30%",
      width_settings_open = "50%",
    },
  },
  popup_input = {
    submit = "<C-Enter>",
    submit_n = "<Enter>",
  },
  -- openai_params = {
  --   model = "gpt-3.5-turbo",
  --   frequency_penalty = 0,
  --   presence_penalty = 0,
  --   max_tokens = 3000,
  --   temperature = 0,
  --   top_p = 1,
  --   n = 1,
  -- },
  predefined_chat_gpt_prompts = "https://gist.githubusercontent.com/kohane27/0758d6575aeec909227493224c80c75d/raw/9a3917075ee34f05b503861bcfe53e2348e2999c/prompt_v3.csv",
})
