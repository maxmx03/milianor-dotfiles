local devicons = require "nvim-web-devicons"

local _, jscolor = devicons.get_icon_color("index.js", "js")
local tsicon, _ = devicons.get_icon_color("index.ts", "ts")
local _, htmlcolor = devicons.get_icon_color("index.html", "html")
local tscolor, csscolor, gitcolor = "#3DB2FF", "#B983FF", "#C84B31"

devicons.set_icon {
  html = {
    icon = "",
    color = htmlcolor,
    name = "html"
  },
  css = {
    icon = "",
    color = csscolor,
    name = "css"
  },
  ts = {
    icon = tsicon,
    color = tscolor,
    name = "typescript"
  },
  [".gitkeep"] = {
    icon = "",
    color = gitcolor,
    name = "git"
  },
  [".gitignore"] = {
    icon = "",
    color = gitcolor,
    name = "git"
  },
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
  },
  ["component.html"] = {
    icon = "",
    color = htmlcolor,
    name = "angularhtml"
  },
  ["component.ts"] = {
    icon = "",
    color = tscolor,
    name = "angularts"
  },
  ["component.css"] = {
    icon = "",
    color = csscolor,
    name = "angularcss"
  }
}

devicons.setup {
  -- your personnal icons can go here (to override)
  -- DevIcon will be appended to `name`
  override = {
    zsh = {
      icon = "",
      color = "#428850",
      name = "Zsh"
    }
  },
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true
}
