
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.keymap.set('n','OF',vim.diagnostic.open_float)

vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
    capabilities = capabilities,
	cmd = {"lua-lsp"}, 
})

vim.lsp.enable('nixd')
vim.lsp.config('nixd', {
    capabilities = capabilities,
	cmd = {"nixd"},
})

--vim.lsp.enable('sourcekit')

vim.lsp.enable('ccls')
vim.lsp.config('ccls',{
	capabilities=capabilities,
	cmd = { "ccls" },
	filetypes = { "c", "cpp", "h", "hpp", "objc", "objcpp" },
	root_markers = {".git", "."},
	init_options = {
		cache = {
			directory = "",  -- desactiva la cache
		},
		clang = {
		  	extraArgs = {
				"-std=c++20",
				"-Wall",
				"-Iinclude",
		  	},
		},
	},
})

vim.lsp.enable('jdtls')
vim.lsp.config('jdtls',{
    capabilities = capabilities,
	cmd = {"jdtls"},
})
