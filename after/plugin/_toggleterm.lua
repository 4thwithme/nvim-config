require("toggleterm").setup({
	direction = 'float',
	open_mapping = [[<A-t>]],
	start_in_insert = true,
	insert_mappings = true,
	float_opts = {
		border = 'double',
		width = 140,
		height = 40,
		zindex = 5,
	}
})
