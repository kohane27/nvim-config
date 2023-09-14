local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  print("chatgpt not working")
end

chatgpt.setup({
  -- api_host_cmd = "echo -n 'api.openai.com'",
  edit_with_instructions = {
    keymaps = {
      close = "q",
      accept = "<C-y>",
      toggle_settings = "<Space>?",
      cycle_windows = "<A-k>",
    },
  },
  chat = {
    keymaps = {
      close = "q",
      new_session = "<A-n>",
      cycle_windows = "<A-k>",
      yank_last_code = "<A-e>", -- no need
      rename_session = "<Space>rn",
      delete_session = "D",
      toggle_settings = "g?",
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
    model = "gpt-4",
  },
  predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/kohane27/nvim-config/main/gpt_prompt.csv",
})
