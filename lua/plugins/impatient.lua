local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  print("impatient not working")
end

impatient.enable_profile()
