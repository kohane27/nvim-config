return {
  "monaqa/dial.nvim",
  event = "VeryLazy",
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal_int, -- decimal integer (including negative number)
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%m/%d/%Y"],
        augend.date.alias["%d/%m/%Y"],
        augend.date.alias["%m/%d/%y"],
        augend.date.alias["%d/%m/%y"],
        augend.date.alias["%m/%d"],
        augend.date.alias["%-m/%-d"],
        augend.date.alias["%Y-%m-%d"],
        augend.date.alias["%H:%M:%S"],
        augend.date.alias["%H:%M"],
        augend.constant.alias.bool, -- boolean value (true <-> false)
        augend.constant.new({
          elements = { "and", "or" },
          word = true, -- if false, "doctor" into "doctand"
          cyclic = true, -- "or" is incremented into "and"
        }),
        augend.constant.new({
          elements = { "True", "False" },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "&&", "||" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "yes", "no" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "disable", "enable" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "start", "stop" },
          word = false,
          cyclic = true,
        }),
      },
    })
  end,
}
