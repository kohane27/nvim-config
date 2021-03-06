local status_ok, clipboard_image = pcall(require, "clipboard-image")
if not status_ok then
  print("clipboard-image failing")
end

clipboard_image.setup({
  -- Default configuration for all filetype
  default = {
    img_dir = "images",
    img_name = function()
      return os.date("%Y-%m-%d-%H-%M-%S")
    end, -- Example result: "2021-04-13-10-04-18"
    affix = "<\n  %s\n>", -- Multi lines affix
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  markdown = {
    img_dir = { "/home/hin/Documents/Obsidian/SecondBrain/900_Resources/images/" }, -- Use table for nested dir
    -- img_dir = { "src", "assets", "img" }, -- Use table for nested dir
    img_dir_txt = "",
    img_name = function()
      return "screenshot-" .. os.date("%Y-%m-%d-%H-%M-%S")
    end, -- Example result: "2021-04-13-10-04-18"
    img_handler = function(img)
      local script = string.format('./image_compressor.sh "%s"', img.path)
      os.execute(script)
    end,
  },
})
