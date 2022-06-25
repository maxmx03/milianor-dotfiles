local gps = require 'nvim-gps'

local icons = {
  kind = {
    Text = '',
    Method = '',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = '',
  },
  type = {
    Array = '',
    Number = '',
    String = '',
    Boolean = '蘒',
    Object = '',
  },
  documents = {
    File = '',
    Files = '',
    Folder = '',
    OpenFolder = '',
  },
  git = {
    Add = '',
    Mod = '',
    Remove = '',
    Ignore = '',
    Rename = '',
    Diff = '',
    Repo = '',
  },
  ui = {
    Lock = '',
    Circle = '',
    BigCircle = '',
    BigUnfilledCircle = '',
    Close = '',
    NewFile = '',
    Search = '',
    Lightbulb = '',
    Project = '',
    Dashboard = '',
    History = '',
    Comment = '',
    Bug = '',
    Code = '',
    Telescope = '',
    Gear = '',
    Package = '',
    List = '',
    SignIn = '',
    Check = '',
    Fire = '',
    Note = '',
    BookMark = '',
    Pencil = '',
    -- ChevronRight = '',
    ChevronRight = '>',
    Table = '',
    Calendar = '',
  },
  diagnostics = {
    Error = '',
    Warning = '',
    Information = '',
    Question = '',
    Hint = '',
  },
  misc = {
    Robot = 'ﮧ',
    Squirrel = '',
    Tag = '',
    Watch = '',
  },
}

gps.setup {
  icons = {
    ['class-name'] = '%#CmpItemKindClass#' .. icons.kind.Class .. '%*' .. ' ', -- Classes and class-like objects
    ['function-name'] = '%#CmpItemKindFunction#' .. icons.kind.Function .. '%*' .. ' ', -- Functions
    ['method-name'] = '%#CmpItemKindMethod#' .. icons.kind.Method .. '%*' .. ' ', -- Methods (functions inside class-like objects)
    ['container-name'] = '%#CmpItemKindProperty#' .. icons.type.Object .. '%*' .. ' ', -- Containers (example: lua tables)
    ['tag-name'] = '%#CmpItemKindKeyword#' .. icons.misc.Tag .. '%*' .. ' ', -- Tags (example: html tags)
    ['mapping-name'] = '%#CmpItemKindProperty#' .. icons.type.Object .. '%*' .. ' ',
    ['sequence-name'] = '%CmpItemKindProperty#' .. icons.type.Array .. '%*' .. ' ',
    ['null-name'] = '%CmpItemKindField#' .. icons.kind.Field .. '%*' .. ' ',
    ['boolean-name'] = '%CmpItemKindValue#' .. icons.type.Boolean .. '%*' .. ' ',
    ['integer-name'] = '%CmpItemKindValue#' .. icons.type.Number .. '%*' .. ' ',
    ['float-name'] = '%CmpItemKindValue#' .. icons.type.Number .. '%*' .. ' ',
    ['string-name'] = '%CmpItemKindValue#' .. icons.type.String .. '%*' .. ' ',
    ['array-name'] = '%CmpItemKindProperty#' .. icons.type.Array .. '%*' .. ' ',
    ['object-name'] = '%CmpItemKindProperty#' .. icons.type.Object .. '%*' .. ' ',
    ['number-name'] = '%CmpItemKindValue#' .. icons.type.Number .. '%*' .. ' ',
    ['table-name'] = '%CmpItemKindProperty#' .. icons.ui.Table .. '%*' .. ' ',
    ['date-name'] = '%CmpItemKindValue#' .. icons.ui.Calendar .. '%*' .. ' ',
    ['date-time-name'] = '%CmpItemKindValue#' .. icons.ui.Table .. '%*' .. ' ',
    ['inline-table-name'] = '%CmpItemKindProperty#' .. icons.ui.Calendar .. '%*' .. ' ',
    ['time-name'] = '%CmpItemKindValue#' .. icons.misc.Watch .. '%*' .. ' ',
    ['module-name'] = '%CmpItemKindModule#' .. icons.kind.Module .. '%*' .. ' ',
  },
  separator = ' ' .. icons.ui.ChevronRight .. ' ',
  depth = 0,
  depth_limit_indicator = '..',
  text_hl = 'LineNr',
}

local function isempty(s)
  return s == nil or s == ''
end

local function filename()
  local filename = vim.fn.expand '%:t'
  local extension = ''
  local file_icon = ''
  local file_icon_color = ''
  local default_file_icon = ''
  local default_file_icon_color = ''

  if not isempty(filename) then
    extension = vim.fn.expand '%:e'

    local default = false

    if isempty(extension) then
      extension = ''
      default = true
    end

    file_icon, file_icon_color = require('nvim-web-devicons').get_icon_color(filename, extension, { default = default })

    local hl_group = 'FileIconColor' .. extension

    vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
    if file_icon == nil then
      file_icon = default_file_icon
      file_icon_color = default_file_icon_color
    end

    return ' ' .. '%#' .. hl_group .. '#' .. file_icon .. '%*' .. ' ' .. '%#LineNr#' .. filename .. '%*'
  end
end

local function get_gps()
  local status_ok, gps_location = pcall(gps.get_location, {})
  if not status_ok then
    return
  end

  if not gps.is_available() then -- Returns boolean value indicating whether a output can be provided
    return
  end

  local retval = filename()

  if gps_location == 'error' then
    return ''
  else
    if not isempty(gps_location) then
      return string.format('%s %s %s', retval, icons.ui.ChevronRight, gps_location)
    else
      return retval
    end
  end
end

vim.api.nvim_create_autocmd({ 'CursorMoved', 'BufWinEnter', 'BufFilePost' }, {
  callback = function()
    local winbar_filetype_exclude = {
      'help',
      'startify',
      'dashboard',
      'packer',
      'neogitstatus',
      'NvimTree',
      'Trouble',
      'alpha',
      'lir',
      'Outline',
      'spectre_panel',
      'toggleterm',
    }

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
      vim.opt.winbar = nil
      return
    end

    local value = get_gps()

    if value == nil then
      value = filename()
    end

    vim.opt.winbar = value
  end,
})
