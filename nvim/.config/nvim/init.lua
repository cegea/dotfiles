vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

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

-- Get OS and architecture
local gon = require("os-name")

local os_name, arch_name = gon.getOS()
print(("os=%q arch=%q"):format(gon.getOS()))
--
-- Keys
vim.cmd("set <M-h>=\\eh")
vim.cmd("set <M-l>=\\el")
vim.keymap.set('n', '<M-h>', ":bprev<CR>")
vim.keymap.set('n', '<M-l>', ":bnext<CR>")

require("lazy").setup("plugins")

