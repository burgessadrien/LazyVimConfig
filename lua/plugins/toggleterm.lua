return {
  {
    "akinsho/toggleterm.nvim",
    version = "^2.13.1",
    lazy = false,
    cmd = { "ToggleTerm" },
    build = ":ToggleTerm",
    keys = {
      {
        "<leader>T",
        desc = "ToggleTerm",
      },
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
        desc = "Select term",
      },
      {
        "<leader>Tt",
        function()
          require("toggleterm").toggle(1, 100, LazyVim.root.get(), "tab")
        end,
        desc = "ToggleTerm (tab root_dir)",
      },
      {
        "<leader>TT",
        function()
          require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
        end,
        desc = "ToggleTerm (tab cwd_dir)",
      },
      {
        "<leader>Tn",
        "<cmd>TermNew<cr>",
        desc = "Open new Terminal",
      },
    },
    config = function()
      local toggleTerm = require("toggleterm")
      toggleTerm.setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          else
            return 20
          end
        end,
        float_opts = {
          -- The border key is *almost* the same as 'nvim_open_win'
          -- see :h nvim_open_win for details on borders however
          -- the 'curved' border is a custom border type
          -- not natively supported but implemented in this plugin.
          border = "curved",
          -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
          title_pos = "center",
          winblend = 3,
          zindex = 9999,
        },
        winbar = {
          enabled = false,
          name_formatter = function(term) --  term: Terminal
            return term.name
          end,
        },
        autochdir = false,
        open_mapping = "<C-\\>",
        hide_numbers = true,
        share_filetypes = {},
        shade_terminals = true,
        shading_factor = "-10",
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        shell = "/usr/bin/fish",
        persist_mode = true,
        direction = "vertical" or "horizontal" or "float" or "window",
        close_on_exit = false,
        auto_scroll = true,
      })
      vim.api.nvim_create_user_command("TermNew", function()
        local term = require("toggleterm.terminal").Terminal:new({})
        term:spawn()
        term:toggle()
      end, {
        bang = true,
        desc = "Toggle a new terminal",
      })
      vim.api.nvim_create_user_command("TermCommand", function(opts)
        if not opts.args or string.len(opts.args) < 1 then
          print("You must pass in a bash command!")
          return
        end
        print(opts.args)

        local term = require("toggleterm.terminal").Terminal:new({ cmd = opts.args })
        term:spawn()
        term:toggle()
      end, {
        bang = true,
        desc = "Watch command in a new terminal",
        nargs = "+",
      })
    end,
  },
}
