ifeq ($(OS),Windows_NT)
	GREEN= [00;32m
	RESTORE= [0m
else
	GREEN="\033[00;32m"
	RESTORE="\033[0m"
endif

# make the output of the message appear green
define style_calls
	$(eval $@_msg = $(1))
	echo ${GREEN}${$@_msg}${RESTORE}
endef

default_target: help

.PHONY: default_target

test:
	@$(call style_calls,"Running tests using nvim")
	@vusted --output=gtest tests/pretty-ts-errors
	@$(call style_calls,"Done!")

.PHONY: test

test-nvim:
	@$(call style_calls,"Running tests using nvim and plenary.nvim")
	@nvim --headless --noplugin -u ./tests/minimal_init.lua -c \
		"PlenaryBustedDirectory tests/pretty-ts-errors { minimal_init = './tests/minimal_init.lua'}"
	@$(call style_calls,"Done!")

.PHONY: test-nvim

lint: style-lint spell
	@$(call style_calls,"Running selene")
	@selene --display-style quiet --config ./selene.toml lua/**/*.lua
	@$(call style_calls,"Done!")
	@$(call style_calls,"Running markdownlint")
	@markdownlint README.md
	@$(call style_calls,"Done!")
	@yamllint -c .yamllint.yml ./**/*.yml
	@$(call style_calls,"Done!")

.PHONY: lint

style-lint:
	@$(call style_calls,"Running stylua check")
	@stylua --color always -f ./stylua.toml --check lua/**/*.lua
	@$(call style_calls,"Done!")

.PHONY: style-lint

format: spell-write
	@$(call style_calls,"Running stylua format")
	@stylua --color always -f ./stylua.toml lua/**/*.lua
	@$(call style_calls,"Done!")

.PHONY: format

spell:
	@$(call style_calls,"Running codespell check")
	@codespell --quiet-level=2 --check-hidden --skip=./.git .
	@$(call style_calls,"Done!")

.PHONY: spell

spell-write:
	@$(call style_calls,"Running codespell write")
	@codespell --quiet-level=2 --check-hidden --skip=./.git --write-changes .
	@$(call style_calls,"Done!")

.PHONY: spell-write

help:
	@$(call style_calls,"Available targets:")
	@echo "  test           Run tests with vusted"
	@echo "  test-nvim      Run tests using nvim and plenary.nvim"
	@echo "  lint           Run selene and stylua check"
	@echo "  style-lint     Run style style check"
	@echo "  format         Run stylua format"
	@echo "  spell          Run spell checker"
	@echo "  spell-write    Run spell checker and write changes"
	@echo "  help           Show this help"

.PHONY: help
