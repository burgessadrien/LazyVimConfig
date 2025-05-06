return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = true,
    keys = {
      {
        "<leader>gm",
        desc = "Git Conflict",
      },
      {
        "<leader>gmc",
        "<cmd>GitConflictChooseOurs<cr>",
        desc = "Choose current",
      },
      {
        "<leader>gmc",
        "<cmd>GitConflictChooseOurs<cr>",
        desc = "Choose current",
      },
      {
        "<leader>gmt",
        "<cmd>GitConflictChooseTheirs<cr>",
        desc = "Choose incoming",
      },
      {
        "<leader>gmb",
        "<cmd>GitConflictChooseBoth<cr>",
        desc = "Choose both",
      },
      {
        "<leader>gmn",
        "<cmd>GitConflictChooseNone<cr>",
        desc = "Choose none",
      },
      {
        "<leader>gm]",
        "<cmd>GitConflictNextConflict<cr>",
        desc = "Move to next conflict",
      },
      {
        "<leader>gm[",
        "<cmd>GitConflictPrevConflict<cr>",
        desc = "Move to next conflict",
      },
      {
        "<leader>gmq",
        "<cmd>GitConflictListQf<cr>",
        desc = "Quick fix",
      },
    },
  },
}
