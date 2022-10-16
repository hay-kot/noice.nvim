local M = {}

--TODO: make configurable
---@type table<string, NoiceFormat>
M.formats = {
  default = { "{level} ", "{title} ", "{message}" },
  notify = { "{message}" },
  details = {
    "{level} ",
    "{date} ",
    "{event}",
    { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } },
    " ",
    "{title} ",
    "{message}",
  },
  telescope = {
    "{level} ",
    "{date} ",
    "{title} ",
    "{message}",
  },
  telescope_preview = {
    "{level} ",
    "{date} ",
    "{event}",
    { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } },
    "\n",
    "{title}\n",
    "\n",
    "{message}",
  },
  lsp_progress = {
    {
      "{progress} ",
      key = "progress.percentage",
      contents = {
        { "{data.progress.message} " },
      },
    },
    "({data.progress.percentage}%) ",
    { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
    { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
    { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
  },
  lsp_progress_done = {
    { "✔ ", hl_group = "NoiceLspProgressSpinner" },
    { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
    { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
  },
}

---@class NoiceFormatOptions
M.defaults = {
  ---@class NoiceFormatOptions.debug
  debug = {
    enabled = true,
  },
  ---@class NoiceFormatOptions.level
  level = {
    hl_group = {
      trace = "NoiceFormatLevelTrace",
      debug = "NoiceFormatLevelDebug",
      info = "NoiceFormatLevelInfo",
      warn = "NoiceFormatLevelWarn",
      error = "NoiceFormatLevelError",
      off = "NoiceFormatLevelOff",
    },
    icons = { error = " ", warn = " ", info = " " },
  },
  ---@class NoiceFormatOptions.progress
  progress = {
    ---@type NoiceFormat
    contents = {},
    width = 20,
    align = "right",
    key = "progress", -- key in message.opts For example: "progress.percentage"
    hl_group = "NoiceFormatProgressTodo",
    hl_group_done = "NoiceFormatProgressDone",
  },
  ---@class NoiceFormatOptions.text
  text = {
    text = nil,
    hl_group = nil,
  },
  ---@class NoiceFormatOptions.spinner
  spinner = {
    ---@type Spinner
    name = "dots",
    hl_group = nil,
  },
  ---@class NoiceFormatOptions.data
  data = {
    key = nil,
    hl_group = nil,
  },
  ---@class NoiceFormatOptions.title
  title = {
    hl_group = "NoiceFormatTitle",
  },
  ---@class NoiceFormatOptions.event
  event = {
    hl_group = "NoiceFormatEvent",
  },
  ---@class NoiceFormatOptions.kind
  kind = {
    hl_group = "NoiceFormatKind",
  },
  ---@class NoiceFormatOptions.date
  date = {
    format = "%X", --- @see https://www.lua.org/pil/22.1.html
    hl_group = "NoiceFormatDate",
  },
  ---@class NoiceFormatOptions.message
  message = {
    hl_group = nil, -- if set, then the hl_group will be used instead of the message highlights
  },
  ---@class NoiceFormatOptions.confirm
  confirm = {
    hl_group = {
      choice = "NoiceFormatConfirm",
      default_choice = "NoiceFormatConfirmDefault",
    },
  },
}

return M
