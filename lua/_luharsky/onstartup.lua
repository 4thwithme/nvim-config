vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.astro_typescript = 'enable'
vim.g.copilot_assume_mapped = true
vim.cmd([[colorscheme black]]);
-- vim.cmd([[colorscheme nordic]]);
vim.g.copilot_filetypes = { markdown = true }
require("nvim-treesitter.install").prefer_git = true
