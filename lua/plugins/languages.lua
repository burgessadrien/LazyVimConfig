return {
  -- Pre-install non-language-extra utilities on Windows.
  -- The language extras in lua/config/lazy.lua configure their own LSP/DAP integrations.
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "codelldb",
        "prettier",
      },
    },
  },
}
