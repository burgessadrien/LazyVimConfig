-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- Enable Nerd Font icons
vim.g.have_nerd_font = true

-- Keep hidden buffers open (helpful for ToggleTerm & buffer switching)
vim.opt.hidden = true

-- Line numbers & relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Enable mouse support in all modes
vim.opt.mouse = "a"

-- Hide mode text since statusline handles mode display
vim.opt.showmode = false

-- Sync clipboard with OS clipboard asynchronously to avoid startup delay
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Indentation & undo history
vim.opt.breakindent = true
vim.opt.undofile = true

-- Smart search case matching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sign column & timing options
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Window split direction preferences
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Whitespace display indicators
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Live substitution preview split
vim.opt.inccommand = "split"

-- Cursorline & scrolling margins
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- TypeScript LSP server configuration
vim.g.lazyvim_ts_lsp = "vtsls"
