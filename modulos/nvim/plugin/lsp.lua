
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


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
vim.lsp.enable('omnisharp')
vim.lsp.config('omnisharp', {
    capabilities = capabilities,
})
vim.lsp.enable('clangd-cpp')
vim.lsp.config('clangd-cpp', {
	filetypes = {'hpp', 'cpp' },
	autostart = true,
	-- Ruta al clangd del sistema
	cmd = { "clangd", 
		"--background-index", 
		"--clang-tidy",
		"--query-driver=/run/current-system/sw/bin/g++"  -- Apunta a GCC
	},
	init_options = {
		fallbackFlags = { "-std=c++17" }
	}
})

vim.lsp.enable('clangd-c')
vim.lsp.config('clangd-c', {
	filetypes = {'h', 'c'},
	autostart = true,
	-- Ruta al clangd del sistema
	cmd = { "clangd", 
		"--background-index", 
		"--clang-tidy",
		"--query-driver=/run/current-system/sw/bin/g++"  -- Apunta a GCC
	},
	init_options = {
		fallbackFlags = { "-std=c17" }
	}
})

vim.lsp.enable('jdtls')
vim.lsp.config('jdtls',{
    capabilities = capabilities,
	cmd = {"jdtls"},
})


vim.lsp.enable('cssls')
vim.lsp.config('cssls', {
	capabilities = capabilities,
})

vim.lsp.enable("html")
vim.lsp.config('html',{
    capabilities = capabilities,
})

vim.lsp.enable("jsonls")
vim.lsp.config('jsonls', {
	capabilities = capabilities,
})
vim.lsp.enable('texlab')




