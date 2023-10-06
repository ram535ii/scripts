" Monzo utilities
nnoremap <leader>jj <cmd>Monzo jump_to_component<cr>
nnoremap <leader>jt <cmd>Monzo jump_to_tool<cr>
nnoremap <leader>jd <cmd>Monzo jump_to_downstream<cr>
nnoremap <leader>jl <cmd>Monzo jump_to_library<cr>
nnoremap <leader>jcc <cmd>Monzo jump_to_catalog_component<cr>
nnoremap <leader>jco <cmd>Monzo jump_to_catalog_owner<cr>
nnoremap <leader>jcs <cmd>Monzo jump_to_catalog_system<cr>
nnoremap <leader>jb <cmd>Monzo jump_to_backstage<cr>

lua <<EOF
	custom_lsp_attach = function(client, bufnr)
			normal_completion_prefix = 'g'
			visual_completion_prefix = '<leader>g'

			local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
			local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

			-- Don't use this when using nvim-cmp
			-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
			buf_set_option('tagfunc', 'v:lua.vim.lsp.tagfunc')

			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			local opts = { noremap=true, silent=true }
			vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
			vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
			vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
			vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

			-- See `:help vim.lsp.*` for documentation on any of the below functions
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
			-- Clashes with tab changing.
			-- buf_set_keymap('n', normal_completion_prefix .. 't', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
			buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
			-- Some useful tips, including hover here:
			-- https://smarttech101.com/nvim-lsp-configure-language-servers-shortcuts-highlights/

			-- Highlight symbol under cursor:
			-- https://smarttech101.com/nvim-lsp-configure-language-servers-shortcuts-highlights/
			if client.resolved_capabilities.document_highlight then
				vim.cmd [[
					hi! LspReferenceRead cterm=bold ctermbg=235 guibg=LightYellow
					hi! LspReferenceText cterm=bold ctermbg=235 guibg=LightYellow
					hi! LspReferenceWrite cterm=bold ctermbg=235 guibg=LightYellow
				]]
				vim.api.nvim_create_augroup('lsp_document_highlight', {})
				vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
					group = 'lsp_document_highlight',
					buffer = 0,
					callback = vim.lsp.buf.document_highlight,
				})
				vim.api.nvim_create_autocmd('CursorMoved', {
					group = 'lsp_document_highlight',
					buffer = 0,
					callback = vim.lsp.buf.clear_references,
				})
			end
	end

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
			-- delay update diagnostics
			update_in_insert = false,
			}
	)


	-- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
	capabilities.textDocument.completion.completionItem.snippetSupport = true

	local lspconfig = require 'lspconfig'
	local monzo_lsp = require 'monzo.lsp'

	lspconfig.gopls.setup(
			monzo_lsp.go_config({

			  -- The script below has this contents, a hack to have gopls not take ages to index (gopls v0.13.2).
				-- #!/usr/bin/env bash
				-- set -euo pipefail
				-- GO111MODULE=off gopls $@
				cmd = { "/Users/constantijn/bin/gopls.sh", "-remote=auto" },
				capabilities = capabilities,
				on_attach = custom_lsp_attach
			})
	)

	-- Component autocompletion
	local cmp = require'cmp'
	local cmp_types = require('cmp.types')

	require'monzo.cmp'

	cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				end,
			},
			completion = {
				autocomplete = {
					cmp_types.cmp.TriggerEvent.TextChanged,
				},
			},
			experimental = {
					native_menu = false,
					ghost_text = false,
			},
			mapping = {
					['<C-x><C-o>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
					-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					 ['<CR>'] = cmp.mapping.confirm({ select = true }),
					['<C-y>'] = cmp.mapping.confirm({ select = true }),
					['<C-b>'] = cmp.mapping.select_prev_item(),
					-- Defaults, except <C-e>
					['<Down>'] = { i = cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Select }), },
					['<Up>'] = { i = cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Select }), },
					['<C-n>'] = { i = cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), },
					['<C-p>'] = { i = cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), },
					['<C-y>'] = { i = cmp.mapping.confirm({ select = false }), },
			},
			sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'vsnip' }, -- For vsnip users.
					{ name = 'monzo_component', max_item_count = 20 },
					{ name = 'monzo_system', max_item_count = 20 },
			}),
	})

	-- Random cute stuff.
	require('mini.indentscope').setup({
	    symbol = "│",
			options = { try_as_border = true },
	})
EOF
