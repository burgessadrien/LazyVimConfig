return {
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    keys = {
      {
        "<leader>gf",
        "<cmd>BlameToggle<cr>",
        desc = "Toggle file blame",
      },
    },
    config = function()
      require("blame").setup({})
    end,
  },
}
