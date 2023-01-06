local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
  print("code_runner not working")
end

code_runner.setup({
  focus = false,
  filetype = {
    -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    -- java = 'cd $dir && cd ../../../../../ && mvn -nsu -e -q compile -T 4 exec:java -Dexec.mainClass="com.prac.App"',
    java = "mvn -nsu -e -q compile -T 4 exec:java",
    python = "python3 -u",
    javascript = "node",
    typescript = "node --no-warnings --experimental-specifier-resolution=node --loader ts-node/esm",
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
    sh = "cd $dir && ./$fileName",
  },
})
