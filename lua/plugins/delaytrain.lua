local status_ok, delaytrain = pcall(require, "delaytrain")
if not status_ok then
  print("delaytrain not working")
end

delaytrain.setup({
  delay_ms = 3000, -- How long repeated usag of a key should be prevented
  grace_period = 3, -- How many repeated keypresse are allowed
  keys = { -- Which keys (in which modes) should be delayed
    ["n"] = { "w", "b" },
    -- ["n"] = { "w", "b", "k", "l", "d", "t", "r", "e", "n" },
  },
})
