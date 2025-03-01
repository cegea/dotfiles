-- Get OS and architecture
gon = require("os-name")
os_name, arch_name = gon.getOS()
--

lsp_confiugration = {}

if arch_name == "x86" then
    return{
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {"pyright"}
                })
            end
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require("lspconfig")
                lspconfig.pyright.setup({})
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
                vim.keymap.set('n', 'K', vim.lsp.buf.code_action, {})
            end
        }
    }
else
    return{
        {
            "williamboman/mason.nvim",
            config = function()
                require("mason").setup()
            end
        },
        {
            "williamboman/mason-lspconfig.nvim",
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = {"lua_ls", "clangd", "pyright"}
                })
            end
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({})
                lspconfig.clangd.setup({})
                lspconfig.pyright.setup({})
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
                vim.keymap.set('n', 'K', vim.lsp.buf.code_action, {})
            end
        }
    }
end
