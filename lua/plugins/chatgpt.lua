return {
  -- TODO: hide `System` component
  "jackMort/ChatGPT.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "folke/trouble.nvim",
  },
  event = "VeryLazy",
  opts = {
    extra_curl_params = { "--proxy", "http://127.0.0.1:8888" },
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
        toggle_system_role_open = "<S-r>",
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
      model = "gpt-4-turbo-2024-04-09",
      max_tokens = 3000,
    },
    openai_edit_params = {
      model = "gpt-4-turbo-2024-04-09",
    },
    predefined_chat_gpt_prompts = "file:///" .. vim.fn.expand("~") .. "/.config/nvim/gpt_prompt.csv",
    show_quickfixes_cmd = "Trouble quickfix",
  },
  config = function(_, opts)
    require("chatgpt").setup(opts)
  end,
}
