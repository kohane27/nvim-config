local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
  print("code_runner not working")
end

code_runner.setup({
  focus = false,
  term = {
    position = "bot",
    -- window size
    size = 8,
  },
  before_run_filetype = function()
    vim.cmd(":w")
  end,
  filetype = {
    javascript = "node",
    -- typescript = "ts-node $fileName",
    typescript = "deno run $fileName",
    typescriptreact = "yarn dev$end",

    -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    -- java = 'cd $dir && cd ../../../../../ && mvn -nsu -e -q compile -T 4 exec:java -Dexec.mainClass="com.prac.App"',
    java = "mvn -nsu -e -q compile -T 4 exec:java",
    -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",

    sh = "bash",
    -- sh = "cd $dir && ./$fileName",
    ledger = "hledger bs -f $dir/$fileName",
    json = "cat $fileName | jq type 1>/dev/null",
    markdown = "sh ~/.local/bin/neovim-to-anki.sh $dir/$fileName",

    python = "python -u",
    rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
    kotlin = "cd $dir && kotlinc-native $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt.kexe",
    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
  },
  -- filetype_path = vim.fn.expand("~/.config/nvim/code_runner.json"),
  -- project_path = vim.fn.expand("~/.config/nvim/project_manager.json"),
})
