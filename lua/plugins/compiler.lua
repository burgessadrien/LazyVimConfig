return {
  { -- This plugin
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      {
        "<leader>C",
        desc = "Compiler",
      },
      {
        "<leader>Cc",
        "<cmd>CompilerStop<cr>" -- (Optional, to dispose all tasks before redo)
          .. "<cmd>CompilerRedo<cr>",
        desc = "Compiler: Stop and Redo task",
      },
      {
        "<leader>Co",
        "<cmd>CompilerOpen<cr>",
        desc = "Compiler: Open",
      },
      {
        "<leader>Ct",
        "<cmd>CompilerToggleResults<cr>",
        desc = "Compiler: Toggle",
      },
    },
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 25,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
