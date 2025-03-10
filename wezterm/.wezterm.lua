-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
-- Detect OS
local os_arch = function()
	local raw_os_name, raw_arch_name = '', ''

	-- LuaJIT shortcut
	if jit and jit.os and jit.arch then
		raw_os_name = jit.os
		raw_arch_name = jit.arch
	else
		-- is popen supported?
		local popen_status, popen_result = pcall(io.popen, "")
		if popen_status then
			popen_result:close()
			-- Unix-based OS
			raw_os_name = io.popen('uname -s','r'):read('*l')
			raw_arch_name = io.popen('uname -m','r'):read('*l')
		else
			-- Windows
			local env_OS = os.getenv('OS')
			local env_ARCH = os.getenv('PROCESSOR_ARCHITECTURE')
			if env_OS and env_ARCH then
				raw_os_name, raw_arch_name = env_OS, env_ARCH
			end
		end
	end

	raw_os_name = (raw_os_name):lower()
	raw_arch_name = (raw_arch_name):lower()

	local os_patterns = {
		['windows'] = 'Windows',
		['linux'] = 'Linux',
		['mac'] = 'Mac',
		['darwin'] = 'Mac',
		['^mingw'] = 'Windows',
		['^cygwin'] = 'Windows',
		['bsd$'] = 'BSD',
		['SunOS'] = 'Solaris',
	}
	
	local arch_patterns = {
		['^x86$'] = 'x86',
		['i[%d]86'] = 'x86',
		['amd64'] = 'x86_64',
		['x86_64'] = 'x86_64',
		['Power Macintosh'] = 'powerpc',
		['^arm'] = 'arm',
		['^mips'] = 'mips',
	}

	local os_name, arch_name = 'unknown', 'unknown'

	for pattern, name in pairs(os_patterns) do
		if raw_os_name:match(pattern) then
			os_name = name
			break
		end
	end
	for pattern, name in pairs(arch_patterns) do
		if raw_arch_name:match(pattern) then
			arch_name = name
			break
		end
	end
	return os_name, arch_name
end

-- This is where you actually apply your config choices
if os_arch == "Windows" then
    config.default_prog = { 'powershell.exe' }
end

-- For example, changing the color scheme:
config.color_scheme = 'catppuccin-frappe'

-- Tabline
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup()

-- Keys
config.keys = {
    {
        key = 'w',
        mods = 'SHIFT|ALT',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 't',
        mods = 'SHIFT|ALT',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain',
    },
    {
        key = '"',
        mods = 'SHIFT|ALT',
        action = wezterm.action.SplitPane {
            direction = 'Right',
            size = { Percent = 50 },
        },
    },
    {
        key = '%',
        mods = 'SHIFT|ALT',
        action = wezterm.action.SplitVertical {
        },
    },
}
-- and finally, return the configuration to wezterm
return config

