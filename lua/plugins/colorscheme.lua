return {
  -- Colorschemes
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "hard",
      transparent_mode = true,
    },
  },
  { "catppuccin/nvim", name = "catppuccin", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "rose-pine/neovim", name = "rose-pine", lazy = false, priority = 1000 },

  -- Themery.nvim: Theme switcher UI
  {
    "zaldih/themery.nvim",
    lazy = false,
    priority = 999,
    keys = {
      { "<leader>uT", "<cmd>Themery<cr>", desc = "Themery Theme Switcher" },
    },
    opts = {
      themes = {
        "gruvbox",
        "tokyonight-night",
        "tokyonight-storm",
        "catppuccin-mocha",
        "catppuccin-macchiato",
        "kanagawa-wave",
        "kanagawa-dragon",
        "rose-pine",
        "habamax",
      },
      livePreview = true,
    },
  },

  -- Configure LazyVim to respect Themery's saved theme from state.json
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        local state_path = vim.fn.stdpath("data") .. "/themery/state.json"
        local f = io.open(state_path, "r")
        if f then
          local content = f:read("*a")
          f:close()
          local ok, data = pcall(vim.json.decode, content)
          if ok and data and data.colorscheme then
            local status = pcall(function()
              vim.cmd.colorscheme(data.colorscheme)
            end)
            if status then
              return
            end
          end
        end
        vim.cmd.colorscheme("gruvbox")
      end,
    },
  },
}
