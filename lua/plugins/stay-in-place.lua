local status_ok, stay_in_place = pcall(require, "stay-in-place")
if not status_ok then
  print("stay_in_place not working")
end

stay_in_place.setup({})
