local telescope = require("telescope");
local fb_actions = require("telescope._extensions.file_browser.actions");
local trouble = require("trouble.providers.telescope");

telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", "dist" },
		layout_strategy = "horizontal",
		sorting_strategy = "ascending",
		vimgrep_arguments = { 'rg', '--hidden', '--color=never', '--no-heading', '--with-filename', '--line-number',
			'--column', '--smart-case' },
		winblend = 0,
		mappings = {
			i = { ["<C-h>"] = "which_key", ["<c-t>"] = trouble.open_with_trouble },
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
		layout_config = {
			prompt_position = "top",
			preview_width = 0.6,
			width = 0.95,
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		}
	},
	extensions = {
		undo = {
			use_delta = true,
			side_by_side = true,
			layout_strategy = "horizontal",
			width = 0.9,
			layout_config = {
				preview_width = 0.7,
			},
			mappings = {
				n = {
					-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
					-- you want to replicate these defaults and use the following actions. This means
					-- installing as a dependency of telescope in it's `requirements` and loading this
					-- extension from there instead of having the separate plugin definition as outlined
					-- above.
					["<C-+>"] = require("telescope-undo.actions").yank_additions,
					["<C-->"] = require("telescope-undo.actions").yank_deletions,
					["<C-r>"] = require("telescope-undo.actions").restore,
				},
			},
		},
		file_browser = {
			hijack_netrw = false,
			use_fd = true,
			prompt_path = false,
			hidden = false,
			collapse_dirs = false,
			grouped = true,
			display_stat = { date = true, size = true },
			git_status = true,
			mappings = {
				["i"] = {
					["<A-c>"] = fb_actions.create,
					["<S-CR>"] = fb_actions.create_from_prompt,
					["<A-r>"] = fb_actions.rename,
					["<A-m>"] = fb_actions.move,
					["<A-y>"] = fb_actions.copy,
					["<A-d>"] = fb_actions.remove,
					["<C-o>"] = fb_actions.open,
					["<C-g>"] = fb_actions.goto_parent_dir,
					["<C-e>"] = fb_actions.goto_home_dir,
					["<C-w>"] = fb_actions.goto_cwd,
					["<C-t>"] = fb_actions.change_cwd,
					["<C-f>"] = fb_actions.toggle_browser,
					["<C-h>"] = fb_actions.toggle_hidden,
					["<C-s>"] = fb_actions.toggle_all,
					["<bs>"] = fb_actions.backspace,
				},
				["n"] = {
					["c"] = fb_actions.create,
					["r"] = fb_actions.rename,
					["m"] = fb_actions.move,
					["y"] = fb_actions.copy,
					["d"] = fb_actions.remove,
					["o"] = fb_actions.open,
					["g"] = fb_actions.goto_parent_dir,
					["e"] = fb_actions.goto_home_dir,
					["w"] = fb_actions.goto_cwd,
					["t"] = fb_actions.change_cwd,
					["f"] = fb_actions.toggle_browser,
					["h"] = fb_actions.toggle_hidden,
					["s"] = fb_actions.toggle_all,
				},
			},
		},
		telescope.load_extension("file_browser"),
		telescope.load_extension('neoclip'),
		telescope.load_extension('undo'),
	}
});
