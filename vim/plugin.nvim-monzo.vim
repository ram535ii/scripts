lua <<EOF
	custom_lsp_attach = function(client, bufnr)
			normal_completion_prefix = 'g'
			visual_completion_prefix = '<leader>g'

			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

			buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
			buf_set_option('tagfunc', 'v:lua.vim.lsp.tagfunc')

			local opts = { noremap=true, silent=true }
			buf_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 'a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 'd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 'i', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 'm', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 'n','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 'o', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 'r', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 's', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
			buf_set_keymap('n', normal_completion_prefix .. 't', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
			buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	end

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
			-- delay update diagnostics
			update_in_insert = false,
			}
	)

	local lspconfig = require 'lspconfig'
	local monzo_lsp = require 'monzo.lsp'

	lspconfig.gopls.setup(
			monzo_lsp.go_config({on_attach = custom_lsp_attach})
	)

	-- Component autocompletion
	local cmp = require'cmp'
	local cmp_types = require('cmp.types')

	require'monzo.cmp'

	cmp.setup({
			completion = {
					autocomplete = false,
			},
			experimental = {
					native_menu = false,
					ghost_text = false,
			},
			mapping = cmp.mapping.preset.insert({
					['<C-x><C-o>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					['<C-x><C-z>'] = cmp.mapping({
							i = cmp.mapping.abort(),
							c = cmp.mapping.close(),
					}),
					['<tab>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'monzo_component', max_item_count = 20 },
					{ name = 'monzo_system', max_item_count = 20 },
			}),
	})
EOF
