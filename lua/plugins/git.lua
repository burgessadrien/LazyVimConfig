return {
  -- Diffview.nvim for visual git diffs and commit history
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
    },
  },

  -- Git-conflict.nvim for inline resolution of merge conflicts
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    keys = {
      { "<leader>co", "<cmd>GitConflictChooseOurs<cr>", desc = "Git Conflict Choose Ours" },
      { "<leader>ct", "<cmd>GitConflictChooseTheirs<cr>", desc = "Git Conflict Choose Theirs" },
      { "<leader>cb", "<cmd>GitConflictChooseBoth<cr>", desc = "Git Conflict Choose Both" },
      { "<leader>c0", "<cmd>GitConflictChooseNone<cr>", desc = "Git Conflict Choose None" },
      { "]x", "<cmd>GitConflictNextConflict<cr>", desc = "Next Conflict" },
      { "[x", "<cmd>GitConflictPrevConflict<cr>", desc = "Previous Conflict" },
      { "<leader>cq", "<cmd>GitConflictListQf<cr>", desc = "List Conflicts in Quickfix" },
    },
  },
}
