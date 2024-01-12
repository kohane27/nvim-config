local status_ok, chatgpt = pcall(require, "chatgpt")
if not status_ok then
  print("chatgpt not working")
end

chatgpt.setup({
  -- api_host_cmd = "echo -n 'api.openai.com'",
  edit_with_instructions = {
    keymaps = {
      close = "<C-q>",
      accept = "<A-y>",
      toggle_diff = "<A-d>",
      toggle_settings = "<A-s>",
      cycle_windows = "<A-k>",
      use_output_as_input = "<C-i>",
    },
  },
  chat = {
    max_line_length = 120,
    welcome_message = "",
    -- question_sign = "❓",
    answer_sign = "🤖",
    -- <Sapce> won't work because keymaps are also triggered in Insert mode
    -- '<C-S-?>' means abandoned
    keymaps = {
      close = "<C-q>",
      yank_last_code = "<A-y>",
      scroll_up = "<C-u>",
      scroll_down = "<C-d>",
      new_session = "<A-n>",
      cycle_windows = "<A-k>",
      stop_generating = "<A-x>",
      cycle_modes = "<A-m>",
      toggle_sessions = "<A-s>",
      select_session = "<Enter>",

      toggle_settings = "<C-S-?>",
      yank_last = "<C-S-?>",
      next_message = "<C-S-?>",
      prev_message = "<C-S-?>",
      rename_session = "<C-S-?>",
      delete_session = "<A-d>",
      draft_message = "<C-S-?>",
      edit_message = "<C-S-?>",
      toggle_message_role = "<C-S-?>",
      toggle_system_role_open = "<C-S-?>",
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
    submit = nil,
    submit_n = "<Enter>",
  },
  openai_params = {
    model = "gpt-4-1106-preview",
    max_tokens = 3000,
  },
  openai_edit_params = {
    model = "gpt-4-1106-preview",
  },
  -- predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/kohane27/nvim-config/main/gpt_prompt.csv",
  predefined_chat_gpt_prompts = "file:///" .. vim.fn.expand("~") .. "/.config/nvim/gpt_prompt.csv",
  show_quickfixes_cmd = "Trouble quickfix",
})
