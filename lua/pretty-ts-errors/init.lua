local config = require("pretty-ts-errors.config")

---@class Plugin
---@field setup fun(opts: PluginOptions|nil)
local M = {}

M.setup = function(opts)
  config.setup(opts or {})
end

return M
