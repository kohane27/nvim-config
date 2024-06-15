return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "llama3",
    host = "localhost",
    port = "11434",
    quit_map = "q", -- close the response window
    retry_map = "<c-r>", -- re-send the current prompt
    init = function(options)
      pcall(io.popen, "ollama serve > /dev/null 2>&1 &")
    end,
    -- initialize Ollama
    command = function(options)
      local body = { model = options.model, stream = true }
      return "curl --silent --no-buffer -X POST http://" .. options.host .. ":" .. options.port .. "/api/chat -d $body"
    end,
    -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
    -- This can also be a command string.
    -- The executed command must return a JSON object with { response, context }
    -- (context property is optional).
    -- list_models = '<omitted lua function>', -- Retrieves a list of model names
    display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
    show_prompt = false, -- Shows the prompt submitted to Ollama.
    show_model = false, -- Displays which model you are using at the beginning of your chat session.
    no_auto_close = false, -- Never closes the window automatically.
    debug = false, -- Prints errors and the command which is run.
  },
}
