local status, devicons = pcall(require, "nvim-web-devicons")

if (not status) then
  return
end

local _, jscolor = devicons.get_icon_color("index.js", "js")
local tsicon, _ = devicons.get_icon_color("index.ts", "ts")
local _, htmlcolor = devicons.get_icon_color("index.html", "html")
local rubyicon = devicons.get_icon_color("index.rb", "rb")
local tscolor, csscolor, gitcolor, angularcolor, karmacolor, jsoncolor, rubycolor, gemcolor, rubocopcolor =
  "#3DB2FF",
  "#7C83FD",
  "#C84B31",
  "#EC4646",
  "#17D7A0",
  "#3E7C17",
  "#FC4F4F",
  "#FA4EAB",
  "#C0C0C0"

local htmlicon, cssicon, nodeicon, giticon, testicon, angularicon, karmaicon, webpackicon, babelicon =
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "ﰩ",
  ""

local function iconConfig(icon, color, name)
  return {
    icon = icon,
    color = color,
    name = name
  }
end

devicons.set_icon {
  html = iconConfig(htmlicon, htmlcolor, "html"),
  css = iconConfig(cssicon, csscolor, "css"),
  ts = iconConfig(tsicon, tscolor, "typescript"),
  rb = iconConfig(rubyicon, rubycolor, "ruby"),
  ["config.ru"] = iconConfig(rubyicon, rubycolor, "ruby"),
  ["Gemfile"] = iconConfig(rubyicon, gemcolor, "GemFile"),
  [".rubocop.yml"] = iconConfig(rubyicon, rubocopcolor, "rubocop"),
  ["package.json"] = iconConfig(nodeicon, jsoncolor, "packagejson"),
  ["package-lock.json"] = iconConfig(nodeicon, jsoncolor, "packagelockjson"),
  [".gitkeep"] = iconConfig(nodeicon, gitcolor, "git"),
  [".gitignore"] = iconConfig(giticon, gitcolor, "git"),
  ["spec.js"] = iconConfig(testicon, jscolor, "javascriptspec"),
  ["spec.jsx"] = iconConfig(testicon, jscolor, "javascriptreactspec"),
  ["spec.ts"] = iconConfig(testicon, tscolor, "typescriptspec"),
  ["spec.tsx"] = iconConfig(testicon, tscolor, "typescriptreactspec"),
  ["test.js"] = iconConfig(testicon, jscolor, "javascripttest"),
  ["test.jsx"] = iconConfig(testicon, jscolor, "javascriptreacttest"),
  ["test.ts"] = iconConfig(testicon, tscolor, "typescripttest"),
  ["test.tsx"] = iconConfig(testicon, tscolor, "typescriptreacttest"),
  ["component.html"] = iconConfig(angularicon, htmlcolor, "angularhtml"),
  ["component.ts"] = iconConfig(angularicon, tscolor, "angularts"),
  ["component.css"] = iconConfig(angularicon, csscolor, "angularcss"),
  ["module.ts"] = iconConfig(angularicon, angularcolor, "angularmode"),
  ["service.ts"] = iconConfig(angularicon, jscolor, "angularservice"),
  ["angular.json"] = iconConfig(angularicon, angularcolor, "angularjson"),
  ["karma.conf.js"] = iconConfig(karmaicon, karmacolor, "karmaconfig"),
  ["webpack.config.js"] = iconConfig(webpackicon, tscolor, "webpack"),
  [".babelrc"] = iconConfig(babelicon, jscolor, "babel")
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
