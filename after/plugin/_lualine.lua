require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 5000,
			tabline = 5000,
			winbar = 5000,
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = { 'mode' },
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	tabline = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = {},
		lualine_x = {
			{
				function()
					local modified = vim.bo.modified

					if modified then
						return '******************************** MODIFIED *************************************************'
					else
						return 'SAVED'
					end
				end,
			},
		},
		lualine_y = {},
		lualine_z = { 'mode' }
	},
	winbar = {
	},
	inactive_winbar = {
	},
	extensions = {
	}
}
