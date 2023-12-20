local status_ok, gp = pcall(require, "gp")
if not status_ok then
  print("gp not working")
end

gp.setup({
  openai_api_key = os.getenv("OPENAI_API_KEY"),
  cmd_prefix = "Gp",
  curl_params = { "--proxy", "http://127.0.0.1:8888" },
  whisper_dir = nil,
  agents = {
    {
      -- Disable ChatGPT 3.5
      name = "ChatGPT3-5",
    },
    {
      -- Disable CodeGPT3-5
      name = "CodeGPT3-5",
    },
    {
      name = "ChatGPT4",
      chat = true,
      command = false,
      model = { model = "gpt-4-1106-preview", temperature = 1.1, top_p = 1 },
      system_prompt = "You are a general AI assistant.\n\n"
        .. "The user provided the additional info about how they would like you to respond:\n\n"
        .. "- If you're unsure don't guess and say you don't know instead.\n"
        .. "- Ask question if you need clarification to provide better answer.\n"
        .. "- Think deeply and carefully from first principles step by step.\n"
        .. "- Zoom out first to see the big picture and then zoom in to details.\n"
        .. "- Use Socratic method to improve your thinking and coding skills.\n"
        .. "- Don't elide any code from your output if the answer requires coding.\n"
        .. "- Take a deep breath; You've got this!\n",
    },
    {
      name = "CodeGPT4",
      chat = false,
      command = true,
      model = { model = "gpt-4-1106-preview", temperature = 0.8, top_p = 1 },
      system_prompt = "You are an AI working as a code editor.\n\n"
        .. "Please AVOID COMMENTARY OUTSIDE OF THE SNIPPET RESPONSE.\n"
        .. "START AND END YOUR ANSWER WITH:\n\n```",
    },
  },
})
