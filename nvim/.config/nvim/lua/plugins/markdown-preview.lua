return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function(plugin)
        local app_dir = plugin.dir .. "/app"
        local install_cmd = nil

        if vim.fn.executable("yarn") == 1 then
            install_cmd = { "yarn", "install" }
        elseif vim.fn.executable("pnpm") == 1 then
            install_cmd = { "pnpm", "install" }
        elseif vim.fn.executable("npm") == 1 then
            install_cmd = { "npm", "install" }
        else
            vim.notify(
                "markdown-preview.nvim requiere yarn/pnpm/npm para instalar dependencias.",
                vim.log.levels.ERROR
            )
            return
        end

        local result = vim.system(install_cmd, { cwd = app_dir, text = true }):wait()
        if result.code ~= 0 then
            vim.notify(
                "Falló la instalación de dependencias de markdown-preview.nvim:\n"
                    .. (result.stderr or result.stdout or "error desconocido"),
                vim.log.levels.ERROR
            )
        end
    end,
    init = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end,
}
