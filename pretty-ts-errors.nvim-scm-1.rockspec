---@diagnostic disable: lowercase-global
--#selene: allow(unscoped_variables, unused_variable)
local _MODREV, _SPECREV = "scm", "-1"

rockspec_format = "3.0"
package = "freeze-code.nvim"
version = _MODREV .. _SPECREV

description = {
  summary = "Pretty TS Errors for NeoVim",
  detailed = [[
    Makes your TypeScript errors pretty and readable.
    ]],
  homepage = "https://github.com/AlejandroSuero/pretty-ts-errors.nvim",
  license = "MIT",
  labels = { "neovim", "typescript", "pretty", "errors", "ts", "typescript-errors", "diagnostics" },
}

dependencies = {
  "lua >= 5.1, < 5.4",
  "luassert",
}

source = {
  url = "git://github.com/AlejandroSuero/pretty-ts-errors.nvim",
}

build = {
  type = "builtin",
  copy_directories = {
    "doc",
  },
}
