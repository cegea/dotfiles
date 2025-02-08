vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
local opts = {}

require("lazy").setup("plugins")

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files,{}) 
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesistter
local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed = {"lua", "c"},
    highlight = {enable = true},
    indent = { enable = true },
})

-- NeoTree
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set('n', '<C-m>', ':Neotree close<CR>', {})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

