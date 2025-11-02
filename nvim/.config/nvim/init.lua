---@diagnostic disable: undefined-global
require("config.lazy")
require("snacks")

vim.opt.winborder = "rounded"
vim.wo.relativenumber = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.smartindent = true
vim.opt.wrap = true        -- Wrap long lines
vim.opt.linebreak = true   -- Wrap lines at word boundaries
vim.opt.breakindent = true -- Maintain indentation on wrapped lines
vim.opt.encoding = "utf-8"
vim.keymap.set("n", "<Tab>", ">>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true })
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
vim.opt.conceallevel = 2

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.opt_local.spell = false
  end,
})

vim.g.lazyvim_check_order = false
      local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

if vim.loop.os_uname().sysname:match("Linux") then
  local output = vim.fn.systemlist("uname -r")
  if output[1] and output[1]:match("microsoft") then
    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = { "/mnt/c/Program Files/Neovim/bin/win32yank.exe", "-i", "--crlf" },
        ["*"] = { "/mnt/c/Program Files/Neovim/bin/win32yank.exe", "-i", "--crlf" },
      },
      paste = {
        ["+"] = { "/mnt/c/Program Files/Neovim/bin/win32yank.exe", "-o", "--lf" },
        ["*"] = { "/mnt/c/Program Files/Neovim/bin/win32yank.exe", "-o", "--lf" },
      },
      cache_enabled = true,
    }
  end
end

-- For Lua (init.lua)
if vim.fn.exists('$TMUX') == 1 then
  vim.opt.termguicolors = true
end
