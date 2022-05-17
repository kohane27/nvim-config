local status_ok, lightspeed = pcall(require, "lightspeed")
if not status_ok then
  return
end

lightspeed.setup({
  ignore_case = true,
  exit_after_idle_msecs = { unlabeled = 5000, labeled = nil },
  --- s/x ---
  jump_to_unique_chars = { safety_timeout = 800 },
  match_only_the_start_of_same_char_seqs = true,
  force_beacons_into_match_width = false,
  -- Display characters in a custom way in the highlighted matches.
  --- f/t ---
  limit_ft_matches = 4,
  repeat_ft_with_target_char = false,
})

vim.cmd([[
" just press s to search
nnoremap s <Plug>Lightspeed_omni_s
" nnoremap S <Plug>Lightspeed_omni_s
]])
