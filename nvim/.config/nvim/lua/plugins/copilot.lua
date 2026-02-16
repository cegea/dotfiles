return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true

        vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', {
            expr = true,
            replace_keycodes = false,
            silent = true,
        })

        vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { silent = false })
        vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { silent = false })
    end,
}
