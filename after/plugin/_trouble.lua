local trouble = require("trouble");


trouble.setup({
	position = "right", -- position of the list can be: bottom, top, left, right
	height = 10, -- height of the trouble list when position is top or bottom
	width = 60, -- width of the list when position is left or right
	icons = true, -- use devicons for filenames
	mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
	fold_open = "", -- icon used for open folds
	fold_closed = "", -- icon used for closed folds
	group = true, -- group results by file
	padding = true, -- add an extra new line on top of the list
	cycle_results = true, -- cycle item list when reaching beginning or end of list
	action_keys = { -- key mappings for actions in the trouble list
		close = "<leader>dq", -- close the list
		cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
		refresh = "<leader>dr", -- manually refresh
		jump = { "<cr>", "<tab>", "<2-leftmouse>" }, -- jump to the diagnostic or open / close folds
		open_split = { "<leader>doh>" }, -- open buffer in new split
		open_vsplit = { "<leader>dov>" }, -- open buffer in new vsplit
		open_tab = { "<leader>oc" }, -- open buffer in new tab
		jump_close = { "<leader>do" }, -- jump to the diagnostic and close the list
		toggle_mode = "<leader>dm", -- toggle between "workspace" and "document" diagnostics mode
		switch_severity = "<leader>ds", -- switch "diagnostics" severity filter level to HINT / INFO / WARN / ERROR
		toggle_preview = "<leader>dP", -- toggle auto_preview
		hover = "K", -- opens a small popup with the full multiline message
		preview = "<leader>dp", -- preview the diagnostic location
		open_code_href = "<leader>dc", -- if present, open a URI with more information about the diagnostic error
		close_folds = { "zM", "zm" }, -- close all folds
		open_folds = { "zR", "zr" }, -- open all folds
		toggle_fold = { "zA", "za" }, -- toggle fold of current file
		previous = "k", -- previous item
		next = "j", -- next item
		help = "?", -- help menu
	},
	multiline = true, -- render multi-line messages
	indent_lines = true, -- add an indent guide below the fold icons
	win_config = { border = "single" }, -- window configuration for floating windows. See |nvim_open_win()|.
	auto_open = false, -- automatically open the list when you have diagnostics
	auto_close = true, -- automatically close the list when you have no diagnostics
	auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
	auto_fold = false, -- automatically fold a file trouble list at creation
	auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
	include_declaration = { "lsp_references", "lsp_implementations", "lsp_definitions" }, -- for the given modes, include the declaration of the current symbol in the results
	signs = {
		-- icons / text used for a diagnostic
		error = "E",
		warning = "W",
		hint = "H",
		information = "I",
		other = "O",
	},
	use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client
})
