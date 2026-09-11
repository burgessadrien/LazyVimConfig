return {
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.spec = opts.spec or {}
      vim.list_extend(opts.spec, {
        { "<leader>T", group = "terminal", icon = "󰞍" },
        { "<leader>g", group = "git", icon = "󰊢" },
        { "<leader>c", group = "code", icon = "" },
        { "<leader>t", group = "test", icon = "󰙨" },
        { "<leader>d", group = "debug", icon = "󰃤" },
      })
    end,
  },
}
