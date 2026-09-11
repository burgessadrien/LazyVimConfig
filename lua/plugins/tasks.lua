return {
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle", "OverseerTaskAction" },
    keys = {
      { "<leader>mr", "<cmd>OverseerRun<cr>", desc = "Run project task" },
      { "<leader>mt", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
      { "<leader>ma", "<cmd>OverseerTaskAction<cr>", desc = "Task action" },
    },
    opts = {
      task_list = { direction = "bottom", min_height = 12, max_height = 20 },
    },
  },
}
