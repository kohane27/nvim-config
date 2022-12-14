-- Setup nvim-cmp
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print("nvim-autopairs not working")
end

npairs.setup({
  check_ts = true,
  ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
  enable_check_bracket_line = false, -- if next character is a close pair and it doesn't have an open pair in same line, then it will not add a close pair
  ts_config = {
    lua = { "string" }, -- it will not add a pair on that treesitter node
    javascript = { "template_string" },
    java = false, -- don't check treesitter on java
  },
  disable_filetype = { "TelescopePrompt", "vim" },
})

-- add mapping `CR` on nvim-cmp setup. Check readme.md on nvim-cmp repo.
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

-- https://github.com/windwp/nvim-autopairs/wiki/Custom-rules#auto-addspace-on-
Rule("=", "")
  :with_pair(cond.not_inside_quote())
  :with_pair(function(opts)
    local last_char = opts.line:sub(opts.col - 1, opts.col - 1)
    if last_char:match("[%w%=%s]") then
      return true
    end
    return false
  end)
  :replace_endpair(function(opts)
    local prev_2char = opts.line:sub(opts.col - 2, opts.col - 1)
    local next_char = opts.line:sub(opts.col, opts.col)
    next_char = next_char == " " and "" or " "
    if prev_2char:match("%w$") then
      return "<bs> =" .. next_char
    end
    if prev_2char:match("%=$") then
      return next_char
    end
    if prev_2char:match("=") then
      return "<bs><bs>=" .. next_char
    end
    return ""
  end)
  :set_end_pair_length(0)
  :with_move(cond.none())
  :with_del(cond.none())
