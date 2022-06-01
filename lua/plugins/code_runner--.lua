local status_ok, code_runner = pcall(require, "code_runner")
if not status_ok then
  return
end

code_runner.setup({
  -- choose default mode (valid term, tab, float, toggle)
  mode = "term",
  -- Focus on runner window (works only on toggle, term and tab mode)
  focus = false,
  startinsert = false,
  filetype = {
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
    python = "python3 -u",
    typescript = "node --no-warnings --experimental-specifier-resolution=node --loader ts-node/esm $fileName",
    javascript = "node",
  },
  -- project = {
  --   ["~/deno/example"] = {
  --     name = "ExapleDeno",
  --     description = "Project with deno using other command",
  --     file_name = "http/main.ts",
  --     command = "deno run --allow-net",
  --   },
  --   ["~/cpp/example"] = {
  --     name = "ExapleCpp",
  --     description = "Project with make file",
  --     command = "make buid & cd buid/ & ./compiled_file",
  --   },
  -- },
})
