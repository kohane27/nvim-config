return {
  -- task runners
  "michaelb/sniprun",
  build = "sh install.sh",
  event = "VeryLazy",
  opts = {
    display = {
      "Classic", --# display results in the command-line area
      -- "VirtualTextOk",           --# display ok results as virtual text (multiline is shortened)
      "VirtualTextErr", --# display error results as virtual text
      -- "Terminal",                --# display results in a vertical split
      -- "TerminalWithCode",        --# display results and code history in a vertical split
    },
  },
}
