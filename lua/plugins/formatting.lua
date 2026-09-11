return {
  -- Configure conform.nvim auto-formatter for GDScript
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.gdscript = { "gdformat" }
    end,
  },

  -- Configure nvim-lint for GDScript code quality analysis
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.gdscript = { "gdlint" }
    end,
  },
}
