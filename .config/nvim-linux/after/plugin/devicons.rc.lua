local devicons = require "nvim-web-devicons"

local _, jscolor = devicons.get_icon_color("index.js", "js")
local tsicon, _ = devicons.get_icon_color("index.ts", "ts")
local _, htmlcolor = devicons.get_icon_color("index.html", "html")
local tscolor, csscolor, gitcolor, angularcolor, karmacolor, jsoncolor =
  "#3DB2FF",
  "#7C83FD",
  "#C84B31",
  "#EC4646",
  "#17D7A0",
  "#3E7C17"

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
  ["package.json"] = {
    icon = "",
    color = jsoncolor,
    name = "packagejson"
  },
  ["package-lock.json"] = {
    icon = "",
    color = jsoncolor,
    name = "packagelockjson"
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
  },
  ["module.ts"] = {
    icon = "",
    color = angularcolor,
    name = "angularmodule"
  },
  ["service.ts"] = {
    icon = "",
    color = jscolor,
    name = "angularservice"
  },
  ["angular.json"] = {
    icon = "",
    color = angularcolor,
    name = "angularmodule"
  },
  ["karma.conf.js"] = {
    icon = "",
    color = karmacolor,
    name = "karmaconfig"
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
