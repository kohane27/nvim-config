local status_ok, bqf = pcall(require, "bqf")
if not status_ok then
  print("bqf not working")
end

-- vim.cmd([[
--     hi BqfPreviewBorder guifg=#3e8e2d ctermfg=71
--     hi BqfPreviewTitle guifg=#3e8e2d ctermfg=71
--     hi BqfPreviewThumb guibg=#3e8e2d ctermbg=71
--     hi link BqfPreviewRange Search
-- ]])

-- https://github.com/kevinhwang91/nvim-bqf#customize-quickfix-window-easter-egg
local fn = vim.fn

function _G.qftf(info)
  local items
  local ret = {}
  if info.quickfix == 1 then
    items = fn.getqflist({ id = info.id, items = 0 }).items
  else
    items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
  end
  local limit = 31
  local fnameFmt1, fnameFmt2 = "%-" .. limit .. "s", "…%." .. (limit - 1) .. "s"
  local validFmt = "%s │%5d:%-3d│%s %s"
  for i = info.start_idx, info.end_idx do
    local e = items[i]
    local fname = ""
    local str
    if e.valid == 1 then
      if e.bufnr > 0 then
        fname = fn.bufname(e.bufnr)
        if fname == "" then
          fname = "[No Name]"
        else
          fname = fname:gsub("^" .. vim.env.HOME, "~")
        end
        -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
        if #fname <= limit then
          fname = fnameFmt1:format(fname)
        else
          fname = fnameFmt2:format(fname:sub(1 - limit))
        end
      end
      local lnum = e.lnum > 99999 and -1 or e.lnum
      local col = e.col > 999 and -1 or e.col
      local qtype = e.type == "" and "" or " " .. e.type:sub(1, 1):upper()
      str = validFmt:format(fname, lnum, col, qtype, e.text)
    else
      str = e.text
    end
    table.insert(ret, str)
  end
  return ret
end

vim.o.qftf = "{info -> v:lua._G.qftf(info)}"

bqf.setup({
  auto_enable = true,
  auto_resize_height = true,
  preview = {
    win_height = 12,
    win_vheight = 12,
    delay_syntax = 80,
    border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
    show_title = false,
    should_preview_cb = function(bufnr, qwinid)
      local ret = true
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      local fsize = vim.fn.getfsize(bufname)
      if fsize > 100 * 1024 then
        -- skip file size greater than 100k
        ret = false
      end
      return ret
    end,
  },
  -- make `drop` and `tab drop` to become preferred
  func_map = {
    drop = "o",
    openc = "O",
    split = "<C-s>",
    tabdrop = "<C-t>",
    -- set to empty string to disable
    tabc = "",
    ptogglemode = "z,",
  },
  filter = {
    fzf = {
      action_for = { ["ctrl-s"] = "split", ["ctrl-t"] = "tab drop" },
      extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> ", "--delimiter", "│" },
    },
  },
})
