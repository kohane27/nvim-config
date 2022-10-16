local status_ok, lightspeed = pcall(require, "lightspeed")
if not status_ok then
  return
end

lightspeed.setup({
  ignore_case = true,
  --- s/x ---
  jump_to_unique_chars = { safety_timeout = 400 },
  match_only_the_start_of_same_char_seqs = true,
  force_beacons_into_match_width = false,
  special_keys = {
    next_match_group = "<space>",
    prev_match_group = "<tab>",
  },
  --- f/t ---
  limit_ft_matches = 4,
  repeat_ft_with_target_char = false,
})

vim.cmd([[
nnoremap s <Plug>Lightspeed_omni_s
nnoremap S <Plug>Lightspeed_omni_s
]])
