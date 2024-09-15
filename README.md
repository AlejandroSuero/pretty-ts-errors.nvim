<a name="readme-top"></a>

# template.nvim

This is a template for Neovim plugins.

## What it includes

- [Neovim](https://neovim.io/) plugin boilerplate.
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) for testing.
  - You can choose to use [vusted](https://github.com/notomo/vusted) or [busted](https://lunarmodules.github.io/busted/) instead or along-side plenary.nvim.
- [Selene](https://github.com/Kampfkarren/selene.nvim) linter.
- [StyLua](https://github.com/JohnnyMorganz/StyLua) formatter.
- [EditorConfig](http://editorconfig.org/) support.
- [Codespell](https://github.com/codespell-project/codespell) spell checker.
- [GitHub Actions](https://github.com/features/actions) for continuous integration.
- [Github Templating](https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/configuring-issue-templates-for-your-repository).

## Actions

Actions for the aforementioned tools are included in the `.github/workflows` directory.

## Templating

This repository is configured to use **GitHub Templates**. To modify them, go to `.github/ISSUE_TEMPLATE` and `.github/PULL_REQUEST_TEMPLATE`.

## How to use

1. Create a new repository from this template.
2. Modify the README.md and plugin name in `lua/your_plugin` and whatever you feel is appropriate.
3. Use `:Telescope live_grep` to search for instances of `your_plugin` or `plugin.nvim` or `your_github_user` in the codebase to replace them with your own.
3. Start coding! 🫡

<div align="right">(<a href="#readme-top">back to top</a>)</div>
