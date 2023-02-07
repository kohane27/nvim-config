local status_ok, recorder = pcall(require, "recorder")
if not status_ok then
  print("recorder not working")
end

recorder.setup({
  -- Named registers where macros are saved. The first register is the default
  -- register/macro-slot used after startup.
  slots = { "a", "b" },
  mapping = {
    startStopRecording = "q",
    playMacro = "Q",
    editMacro = "cq",
  },
  clear = true, -- clears all macros-slots on startup
  dapSharedKeymaps = false, -- experimental, see README
})
