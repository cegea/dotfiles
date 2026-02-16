return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")

            vim.keymap.set("n", "<F5>", dap.continue)
            vim.keymap.set("n", "<F10>", dap.step_over)
            vim.keymap.set("n", "<F11>", dap.step_into)
            vim.keymap.set("n", "<F12>", dap.step_out)
            vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dB", function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end)
            vim.keymap.set("n", "<leader>dr", dap.repl.open)
            vim.keymap.set("n", "<leader>dt", dap.terminate)
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mason.nvim", "mfussenegger/nvim-dap" },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "python", "codelldb" },
                automatic_installation = true,
            })
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "mfussenegger/nvim-dap" },
        ft = "python",
        config = function()
            local python_path = vim.fn.exepath("python3")
            if python_path == "" then
                python_path = "python"
            end
            require("dap-python").setup(python_path)
        end,
    },
}
