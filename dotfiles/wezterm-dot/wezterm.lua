local wezterm = require 'wezterm'

wezterm.on("copy-last-output", function(window, pane)
  local zones = pane:get_semantic_zones()
  local last_output = nil

  for i = #zones, 1, -1 do
    if zones[i].semantic_type == "Output" then
      last_output = zones[i]
      break
    end
  end

  if last_output then
    local text = pane:get_text_from_semantic_zone(last_output)
    window:copy_to_clipboard(text)
    window:toast_notification("Copied", "Last command output copied!")
  else
    window:toast_notification("No output", "No command output found")
  end
end)

return {
  keys = {
    {
      key = "O",
      mods = "ALT",
      action = wezterm.action_callback(function(window, pane)
        window:emit_event("copy-last-output")
      end)
    }
  }
}   
