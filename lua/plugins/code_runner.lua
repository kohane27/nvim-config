local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
  print("code_runner not working")
end

code_runner.setup({
  focus = false,
  filetype = {
    javascript = "node",
    typescript = "node --no-warnings --experimental-specifier-resolution=node --loader ts-node/esm",
    -- typescript = "deno run",
    typescriptreact = "yarn dev$end",

    -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    -- java = 'cd $dir && cd ../../../../../ && mvn -nsu -e -q compile -T 4 exec:java -Dexec.mainClass="com.prac.App"',
    java = "mvn -nsu -e -q compile -T 4 exec:java",
    -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",

    sh = "bash",
    -- sh = "cd $dir && ./$fileName",

    python = "python -u",
    rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
    kotlin = "cd $dir && kotlinc-native $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt.kexe",
    c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
    cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
  },
  filetype_path = vim.fn.expand("~/.config/nvim/code_runner.json"),
  project_path = vim.fn.expand("~/.config/nvim/project_manager.json"),
})
