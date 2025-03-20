local M = {}
local arch_aliases = {
    ["x86_64"] = "x64",
    ["i386"] = "x86",
    ["i686"] = "x86", -- x86 compat
    ["aarch64"] = "arm64",
    ["aarch64_be"] = "arm64",
    ["armv8b"] = "arm64", -- arm64 compat
    ["armv8l"] = "arm64", -- arm64 compat
}

function M.getOS()
	local raw_os_name, raw_arch_name = '', ''

    local uname = vim.loop.os_uname()
    local arch_name = arch_aliases[uname.machine] or uname.machine
    local os_name = uname.sysname

	return os_name, arch_name
end

return M
