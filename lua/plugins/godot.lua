return {
  -- Treesitter support for GDScript and Godot resources
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "gdscript", "godot_resource", "gdshader", "glsl", "wgsl" })
      end
    end,
  },

  -- LSP support for Godot (GDScript)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {},
      },
    },
  },

  -- DAP (debugging) support for Godot
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")
      dap.adapters.godot = {
        type = "server",
        host = "127.0.0.1",
        port = 6006,
      }
      dap.configurations.gdscript = {
        {
          type = "godot",
          request = "launch",
          name = "Launch Scene",
          project = "${workspaceFolder}",
          launch_scene = true,
        },
        {
          type = "godot",
          request = "launch",
          name = "Launch Main Project",
          project = "${workspaceFolder}",
          launch_scene = false,
        },
      }
    end,
  },

  -- Godot helper plugin for project execution and scene management
  {
    "lommix/godot.nvim",
    cmd = { "GodotRun", "GodotRunLast", "GodotRunCurrent", "GodotRunFZF" },
    ft = { "gdscript" },
    opts = {
      bin = "godot",
    },
    config = function(_, opts)
      require("godot").setup(opts)

      -- Custom commands for Godot testing (GUT / GdUnit4 runner)
      vim.api.nvim_create_user_command("GodotTest", function()
        local cwd = vim.uv.cwd()
        vim.cmd("terminal godot --path " .. vim.fn.shellescape(cwd) .. " -s addons/gut/gut_cmdln.gd")
      end, { desc = "Run Godot GUT Unit Tests" })

      vim.api.nvim_create_user_command("GodotTestFile", function()
        local file = vim.fn.expand("%:p")
        local cwd = vim.uv.cwd()
        vim.cmd("terminal godot --path " .. vim.fn.shellescape(cwd) .. " -s addons/gut/gut_cmdln.gd -gselect=" .. vim.fn.shellescape(file))
      end, { desc = "Run Current GDScript Test File" })
    end,
  },
}
