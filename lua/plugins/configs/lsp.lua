local lsp = require('lsp-zero').preset({
	manage_nvim_cmp = {
		set_extra_mappings = true,
	}
})

lsp.setup("recommended")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
	local opts = { buffer = bufnr }

	vim.keymap.set({ 'n', 'x' }, 'gq', function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)
end)
lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

lsp.setup()

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		lsp.default_setup,
	},
})

-- LSPKIND
local lspkind = require('lspkind')

-- SIGNATURES

require "lsp_signature".setup({
	bind = true,
	doc_lines = 10,
	floating_window = true,
	fix_pos = true,
	hint_enable = true,
	hint_scheme = "String",
	hi_parameter = "Search",
	max_height = 22,
	max_width = 120,
	handler_opts = {
		border = "rounded", -- double, single, shadow, none
	},
	zindex = 50,
	padding = " ",
	floating_window_above_cur_line = true,
})

-- CMP
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<CR>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = '... ', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			before = function(entry, vim_item)
				return vim_item
			end
		})
	}
})


require("luasnip.loaders.from_vscode").lazy_load()
