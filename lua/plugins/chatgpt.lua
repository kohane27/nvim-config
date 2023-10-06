local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  print("chatgpt not working")
end

chatgpt.setup({
  -- api_host_cmd = "echo -n 'api.openai.com'",
  -- `<C-S-?>` means disposed
  chat = {
    max_line_length = 120,
    -- <Sapce> won't work because keymaps are also triggered in Insert mode
    keymaps = {
      close = "<C-q>",
      yank_last = "<C-y>",
      yank_last_code = "<C-S-k>",
      scroll_up = "<C-u>",
      scroll_down = "<C-d>",
      new_session = "<A-n>",
      cycle_windows = "<A-k>",
      cycle_modes = "<A-m>",
      select_session = "<C-S-s>",
      rename_session = "<C-S-r>",
      delete_session = "<C-S-d>",
      draft_message = "<C-S-d>",
      toggle_settings = "<C-S-d>",
      toggle_message_role = "<C-S-r>",
      toggle_system_role_open = "g?",
      stop_generating = "<A-x>",
    },
  },
  edit_with_instructions = {
    keymaps = {
      close = "<C-q>",
      accept = "<C-y>",
      toggle_diff = "<C-d>",
      toggle_settings = "<C-o>",
      cycle_windows = "<Tab>",
      use_output_as_input = "<C-i>",
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
    frequency_penalty = 0,
    presence_penalty = 0,
    max_tokens = 4096,
    temperature = 0,
    top_p = 1,
    n = 1,
  },
  predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/kohane27/nvim-config/main/gpt_prompt.csv",
  show_quickfixes_cmd = "Trouble quickfix",
})
