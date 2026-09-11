return {
  {
    "akinsho/toggleterm.nvim",
    lazy = false,
    cmd = { "ToggleTerm" },
    build = ":ToggleTerm",
    keys = {
      {
        "<leader>Ta",
        "<cmd>ToggleTermToggleAll<cr>",
        desc = "ToggleTermToggleAll",
      },
      {
        "<leader>Tf",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, LazyVim.root.get(), "float")
        end,
        desc = "ToggleTerm (float root_dir)",
      },
      {
        "<leader>Th",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 15, LazyVim.root.get(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
      },
      {
        "<leader>Tv",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
      {
        "<leader>TN",
        "<cmd>ToggleTermSetName<cr>",
        desc = "Set term name",
      },
      {
        "<leader>Ts",
        "<cmd>TermSelect<cr>",
        desc = "Select terminal",
      },
      {
        "<leader>Tt",
        "<cmd>ToggleTerm<cr>",
        desc = "ToggleTerm",
      },
    },
    opts = {
      open_mapping = [[<c-\>]],
      direction = "float",
      shade_terminals = true,
      float_opts = {
        border = "curved",
      },
    },
  },
}
