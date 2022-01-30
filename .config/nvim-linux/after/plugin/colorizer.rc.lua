local status, colarizer = pcall(require, "colorizer")

if (not status) then
  return
end

colarizer.setup()
