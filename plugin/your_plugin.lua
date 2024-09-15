if vim.fn.has("nvim-0.9.0") ~= 1 then
  local current_version = vim.version()
  local err_msg = string.format(
    "[your_plugin.nvim] plugin requires at least NeoVim v0.9.0, current version: v%s.%s.%s",
    current_version.major,
    current_version.minor,
    current_version.patch
  )
  vim.api.nvim_err_writeln(err_msg)
  return
end

-- Check if plugin is loaded
if vim.g.loaded_plugin_nvim == 1 then
  return
end
vim.g.loaded_plugin_nvim = 1
vim.api.nvim_out_write("[your_plugin.nvim] initialized")
