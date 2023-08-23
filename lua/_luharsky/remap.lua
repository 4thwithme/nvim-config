local mark = require('harpoon.mark');
local ui = require('harpoon.ui');
local opts = { noremap = true, silent = true }

-- common keybindings
vim.g.mapleader = " ";
vim.keymap.set("v", "<S-Down>", ":m '>+1<CR>gv=gv");
vim.keymap.set("v", "<S-Up>", ":m '<-2<CR>gv=gv");
vim.keymap.set("n", "<S-d>", "<C-d>zz")
vim.keymap.set("n", "<S-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "COPY to buffer" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "COPY to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "CUT to clipboard" })
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz");
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz");
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz");
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz");
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace word to new" });
vim.keymap.set("n", "<leader>nh", ":silent! nohls<cr>", opts)
-- harpoon keybindings
vim.keymap.set('n', '<leader>a', mark.add_file, { desc = "Harpoon Add" });
vim.keymap.set('n', '<leader>h', ui.toggle_quick_menu, { desc = "Harpoon Check" });
for i = 1, 9, 1 do vim.keymap.set('n', '<leader>' .. i, function() ui.nav_file(i) end, { desc = "Harpoon " .. i }); end
;
-- telescope
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').git_status, { desc = ' [G]it [s]pened files' })
vim.keymap.set('n', '<leader>fo', require('telescope.builtin').oldfiles, { desc = ' [F]ind recently [o]pened files' })
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>f/', function()
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Fuzzily search in current buffer' })
-- undo
vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = '[F]iles [U]ndo' })
-- file browser
vim.api.nvim_set_keymap("n", "|",
	":Telescope file_browser path=%:p:h select_buffer=true prompt_path=true default_selection_index=2 grouped=true git_status=true hidden=true<CR>",
	{ noremap = true })
-- clipboard history
vim.keymap.set({ "n", "v" }, "<leader>fc", ":Telescope neoclip<CR>", { desc = '[F]ind [C]opy items' }, { noremap = true });
-- bufferline
for i = 1, 9, 1 do vim.keymap.set({ "n", "v" }, "<A-" .. i .. ">", ":BufferLineGoToBuffer " .. i .. "<CR>", opts) end
vim.keymap.set({ "n", "v" }, "<A-.>", ":BufferLineCycleNext<CR>", opts)
vim.keymap.set({ "n", "v" }, "<A-,>", ":BufferLineCyclePrev<CR>", opts)
vim.keymap.set({ "n", "v" }, "<A->>", ":BufferLineMoveNext<CR>", opts)
vim.keymap.set({ "n", "v" }, "<A-<>", ":BufferLineMovePrev<CR>", opts)
vim.keymap.set({ "n", "v" }, "<A-c>", ":BufferLinePickClose<CR>", opts)
