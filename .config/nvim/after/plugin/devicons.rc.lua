local devicons = require "nvim-web-devicons"

local _, jscolor = devicons.get_icon_color("index.js", "js")
local _, tscolor = devicons.get_icon_color("index.ts", "ts")

devicons.set_icon {
  ["spec.js"] = {
    icon = "",
    color = jscolor,
    name = "javascriptspec"
  },
  ["spec.ts"] = {
    icon = "",
    color = tscolor,
    name = "typescriptspec"
  },
  ["test.js"] = {
    icon = "",
    color = jscolor,
    name = "javascripttest"
  },
  ["test.ts"] = {
    icon = "",
    color = tscolor,
    name = "typescripttest"
  }
}
