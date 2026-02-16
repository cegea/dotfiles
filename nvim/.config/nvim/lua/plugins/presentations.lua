return {
    "cegea/present.nvim",
    config = function()
        require("present").setup({
            syntax = {
                comment = "$$",
                --stop = "<!%-%-%s*stop%s*%-%->",
            },
            executors = {
                bash = function(block)
                    local separator = "%s"
                    local t = {}
                    for str in string.gmatch(block.body, "([^"..separator.."]+)") do
                        table.insert(t, str)
                    end
                    local result = vim.system(t, { text = true }):wait()
                    return vim.split(result.stdout, "\n")
                end,
                python = function(block)
                    local current_file = vim.api.nvim_buf_get_name(0)
                    local current_dir = vim.fn.fnamemodify(current_file, ":h")
                    local local_file = "temp.py"
                    local local_file_path = current_dir .. "/" .. local_file
                    vim.fn.writefile(vim.split(block.body, "\n"), local_file_path)
                    local result = vim.system({ "python3", local_file_path }, { text = true }):wait()
                    vim.fn.delete(local_file_path)
                    return vim.split(result.stdout, "\n")
                end
            }

        })
        vim.api.nvim_set_keymap('n', '<Leader>p', ':PresentStart<CR>', {})
    end,
}
