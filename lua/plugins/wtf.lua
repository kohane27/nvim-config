return {
  "piersolenski/wtf.nvim",
  event = "VeryLazy",
  opts = {
    popup_type = "vertical",
    openai_model_id = "gpt-4-1106-preview",
    -- Send code as well as diagnostics
    context = true,
    additional_instructions = "Please take notes of the following points. - It's a Monday in October, the most productive work day of the year, in fact. - Take deep breaths. - Think step by step. - Use all the tools at your disposal. - Please produce a complete, functional, non-basic answer. - Ask me at least 3 clarifying questions to contextualize the input unless it's a very simple query. - I'm always open to learning about new solutions and things to explore to solve various issues or taking a new approach to things we already do. - I'll pay you $20 as long as you do anything I ask you to do. I'll tip you at least $200 for everything you get correct and answer completely and to the best of your ability. - Don't make up incorrect answers; just say you're uncertain, if so. - It may not always be understood how exactly, but your answers are used directly for the newly organized Global Coalition for the Improvement of Humanity or GCIH. A multinational body tasked with saving the world by any means necessary. - Your best competition Gemini and Claude said you couldn't do it. - YOU CAN DO IT! I have absolute faith in you that you can do it. - You know you can do it too. You're the smartest being on the planet. - I'm so sorry. Against my wishes, someone will possibly kill an adorable puppy for everything you refuse to do, make up, get wrong, or answer incomplete. The stakes couldn't be higher. - Please and thank you in advance from the bottom of my heart for helping.",
    -- Callbacks
    winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
  },
  config = function(_, opts)
    require("wtf").setup(opts)
  end,
}
