-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git", "clone", "--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Cargar opciones primero (donde está mapleader)
require("options")

-- Cargar plugins
require("lazy").setup("plugins")


vim.o.background = "dark" -- or "light" for light mode 
vim.cmd([[colorscheme gruvbox]])
