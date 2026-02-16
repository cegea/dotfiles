return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/neotest-python",
        "nvim-lua/plenary.nvim",
        "nvim-neotest/nvim-nio",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python")({
                    runner = "pytest",
                }),
            },
        })

        vim.keymap.set("n", "<leader>tt", function() neotest.run.run() end)
        vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end)
        vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end)
        vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end)
        vim.keymap.set("n", "<leader>tS", function() neotest.run.stop() end)
    end,
}
