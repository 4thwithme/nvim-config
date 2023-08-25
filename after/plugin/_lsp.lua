local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre" -- or "BufWritePost"

lsp.setup_servers({ 'tsserver', 'eslint_d', 'astro', 'lua_ls', 'prismals' })
lsp.ensure_installed({
	'tsserver',
	'astro',
	'lua_ls',
	'eslint_d',
	'prismals'
});

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
	['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
	["<cr>"] = cmp.mapping.confirm({ select = true }),
	["<C-c>"] = cmp.mapping.complete(),
	["<C-ab>"] = cmp.mapping.abort(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
});

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = 'E',
		warn = 'W',
		hint = 'H',
		info = 'I'
	}
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		['prismals'] = { 'prisma' },
		['lua_ls'] = { 'lua' },
		['rust_analyzer'] = { 'rust' },
		['null-ls'] = { 'javascript', 'typescript', 'typescriptreact' },
	}
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts);

	if client.supports_method("textDocument/formatting") then
		vim.keymap.set("n", "<Leader>lf", function()
			vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
		end, { buffer = bufnr, desc = "[lsp] format" })

		-- format on save
		vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
		vim.api.nvim_create_autocmd(event, {
			buffer = bufnr,
			group = group,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr, async = false })
			end,

			desc = "[lsp] format on save",
		})
	end
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
