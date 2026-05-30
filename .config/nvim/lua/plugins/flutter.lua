return {
  {
    "akinsho/flutter-tools.nvim",

    lazy = false,

    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },

    config = function()
      require("flutter-tools").setup({
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
        },

        widget_guides = {
          enabled = true,
        },

        lsp = {
          settings = {
            completeFunctionCalls = true,
            showTodos = true,
          },

          cmd = {
            "dart",
            "language-server",
            "--protocol=lsp",
          },
        },
      })
    end,
  },
}
