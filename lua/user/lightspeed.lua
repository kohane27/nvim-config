local status_ok, lightspeed = pcall(require, "lightspeed")
if not status_ok then
	return
end

lightspeed.setup {
  exit_after_idle_msecs = { labeled = nil, unlabeled = 10000 },
  -- s/x
  grey_out_search_area = true,
  highlight_unique_chars = true,
  match_only_the_start_of_same_char_seqs = true,
  jump_on_partial_input_safety_timeout = 10000,
  -- f/t
  limit_ft_matches = 8,
  repeat_ft_with_target_char = false,
}
