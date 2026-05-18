vim.g.mapleader = " "
require("obsidian").setup({
	workspaces = {
		{
			name = "Bóveda",
			path = "~/Documentos/Bóveda",
		},
	},

	legacy_commands=false,
	notes_subdir = "Limbo",

	daily_notes = {
		folder = "daily",
		date_format = "%Y-%m-%d",
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},
	ui = {
		enable = true,
	},
	callbacks = {
		enter_note = function(note)
			vim.keymap.set("n", "<leader>ch", "<cmd>Obsidian toggle_checkbox<cr>", {
				buffer = true,
				desc = "Toggle checkbox",
			})
		end,
	},
})
