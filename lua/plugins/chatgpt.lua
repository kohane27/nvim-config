local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  print("chatgpt not working")
end

chatgpt.setup({
  edit_with_instructions = {
    keymaps = {
      close = "<C-w>c",
      accept = "<C-y>",
      toggle_settings = "<Space>?",
      cycle_windows = "<A-l>",
    },
  },
  chat = {
    keymaps = {
      close = "<C-w>c",
      new_session = "<A-n>",
      cycle_windows = "<A-l>",
      yank_last_code = "<A-k>",
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
  openai_params = {
    model = "gpt-3.5-turbo",
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 3000,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/kohane27/nvim-config/main/gpt_prompt.csv",
})
