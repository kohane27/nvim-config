local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
  print("code_runner failing")
end

code_runner.setup({
  filetype = {
    -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "deno run",
    java = 'cd $dir && cd ../../../../../ && mvn -nsu -e -q compile -T 4 exec:java -Dexec.mainClass="com.prac.App"',
    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
  },
})
