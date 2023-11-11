local status_ok, llm = pcall(require, "llm")
if not status_ok then
  print("auto-format not working")
end

llm.setup({
  prompts = {
    gpt = vim.tbl_extend("force", require("llm.providers.openai").default_prompt, {
      options = {
        curl_args = { "--proxy", "http://127.0.0.1:8888" },
      },
    }),
  },
  default_prompt = {
    provider = require("llm.providers.openai"),
    options = {
      curl_args = { "--proxy", "http://127.0.0.1:8888" },
    },
    builder = function(input)
      return {
        model = "gpt-4-1106-preview",
        temperature = 0.3,
        max_tokens = 1000,
        messages = {
          {
            role = "system",
            content = "You are a helpful assistant.",
          },
          {
            role = "user",
            content = input,
          },
        },
      }
    end,
  },
})
