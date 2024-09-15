if vim.fn.has("nvim-0.9.0") ~= 1 then
  local current_version = vim.version()
  local err_msg = string.format(
    "[pretty-ts-errors.nvim] plugin requires at least Neovim v0.9.0, current version: v%s.%s.%s",
    current_version.major,
    current_version.minor,
    current_version.patch
  )
  vim.api.nvim_err_writeln(err_msg)
  return
end

-- Check if plugin is loaded
if vim.g.loaded_pretty-ts-errors.nvim == 1 then
  return
end
vim.g.loaded_pretty-ts-errors.nvim = 1
vim.api.nvim_out_write("[pretty-ts-errors.nvim] initialized")
