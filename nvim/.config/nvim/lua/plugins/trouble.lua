return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("trouble").setup({})

        vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
        vim.keymap.set("n", "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
        vim.keymap.set("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>")
        vim.keymap.set("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>")
        vim.keymap.set("n", "<leader>xr", "<cmd>Trouble lsp_references toggle<cr>")
    end,
}
