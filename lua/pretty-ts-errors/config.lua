---@class PluginOptions
---@field some_option? boolean
---@field other_option? string
---@field bunch_of_options? table<string, string>
local default_config = {
  some_option = true,
  other_option = "foo",
  bunch_of_options = {
    foo = "bar",
    bar = "baz",
  },
}

---@class PluginConfig
---@field config PluginOptions
---@field setup fun(opts: PluginOptions|nil)
local M = {
  config = vim.deepcopy(default_config),
}

M.setup = function(opts)
  local config = vim.tbl_deep_extend("force", {}, vim.deepcopy(default_config), opts or {})
  M.config = config
end

return setmetatable(M, {
  __index = function(_, key)
    if key == "setup" then
      return M.setup
    end
    return rawget(M.config, key)
  end,
})
