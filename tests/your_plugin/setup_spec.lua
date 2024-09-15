describe("[your_plugin.nvim tests]", function()
  describe("setup", function()
    it("should set up the plugin with the default config", function()
      require("your_plugin").setup()
      local expected = require("your_plugin.config").config

      assert.not_nil(expected)
    end)

    it("should set up the plugin with a custom config", function()
      require("your_plugin").setup({
        some_option = false,
        bunch_of_options = {
          foo = "foo",
        },
      })
      local expected = require("your_plugin.config").config

      assert.is_false(expected.some_option, "some_option should be false")
      assert.are.same(expected.bunch_of_options.foo, "foo", "bunch_of_options.foo should be foo")
      assert.are.same(expected.bunch_of_options, { foo = "foo", bar = "baz" }, "bunch_of_options.bar is default value")
    end)
  end)
end)
