local status, tabnine = pcall(require, "cmp_tabnine.config")

if (not status) then
  return
end

tabnine:setup(
  {
    max_lines = 1000,
    max_num_results = 10,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = ".."
  }
)
