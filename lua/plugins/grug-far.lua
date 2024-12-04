return {
  "MagicDuck/grug-far.nvim",
  event = "VeryLazy",
  opts = {
    -- shortcuts for the actions you see at the top of the buffer
    keymaps = {
      qflist = { n = "<localleader>c" },
      close = { n = "<localleader>q" },
      refresh = { n = "<localleader>r" },
      syncLine = { n = "<localleader>s" },
      syncLocations = { n = "<localleader>S" },
      -- does not work with removed results
      replace = { n = false },
    },
    keymaps1 = {},
    engines = {
      ripgrep = {
        -- set individual ones to '' to disable, or set enabled = false for complete disable
        placeholders = {
          enabled = true,
          search = "ex: foo   foo([a-z0-9]*)   fun\\(",
          replacement = "ex: bar   ${1}_foo   $$MY_ENV_VAR ",
          replacement_lua = 'ex: if vim.startsWith(match, "use") \\n then return "employ" .. match \\n else return match end',
          filesFilter = "ex: *.lua   *.{css,js}   **/docs/*.md   (specify one per line)",
          flags = "ex: --help --ignore-case --fixed-strings --multiline --replace= (empty replace)",
          paths = "ex: /foo/bar   ../   ./hello\\ world/   ./src/foo.lua",
        },
      },
    },
  },
}
