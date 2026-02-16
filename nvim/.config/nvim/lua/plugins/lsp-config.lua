return {
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
                ensure_installed = { "lua_ls", "clangd", "pyright" }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "saghen/blink.cmp" },
        config = function()
            local has_blink, blink = pcall(require, "blink.cmp")
            local capabilities = has_blink and blink.get_lsp_capabilities() or nil
            local servers = { "lua_ls", "clangd", "pyright" }

            if vim.lsp.config and vim.lsp.enable then
                for _, server in ipairs(servers) do
                    vim.lsp.config(server, { capabilities = capabilities })
                    vim.lsp.enable(server)
                end
            else
                local lspconfig = require("lspconfig")
                lspconfig.lua_ls.setup({ capabilities = capabilities })
                lspconfig.clangd.setup({ capabilities = capabilities })
                lspconfig.pyright.setup({ capabilities = capabilities })
            end

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
