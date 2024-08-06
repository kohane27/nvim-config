return {
  -- "stevearc/overseer.nvim",
  "CRAG666/code_runner.nvim",
  event = "VeryLazy",
  opts = {
    focus = false,
    term = {
      position = "vertical",
      size = vim.o.columns * 0.40,
      -- position = "bot",
      -- size = vim.o.lines * 0.25,
    },
    before_run_filetype = function()
      vim.cmd(":w")
    end,
    filetype = {
      javascript = "node",
      typescript = "deno run",
      -- typescript = "ts-node",

      sh = "zsh",
      ledger = "hledger bs -f $dir/$fileName",
      json = "cat $fileName | jq type 1>/dev/null",
      -- markdown = "sh ~/.local/bin/neovim-to-anki.sh $dir/$fileName",
      python = "python3 -u",
      java = { "cd $dir &&", "javac $fileName &&", "java $fileNameWithoutExt" },
      rust = { "cd $dir &&", "rustc $fileName &&", "$dir/$fileNameWithoutExt" },
    },
  },
}
