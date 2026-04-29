-- Lualine
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			icons_enabled = true,
			theme = 'gruvbox',
		})
	end
}
