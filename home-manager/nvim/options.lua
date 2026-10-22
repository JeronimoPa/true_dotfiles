vim.keymap.set('n', ' ', '<Nop>')
vim.g.mapleader = ' '
local dap = require("dap")
local dapui = require("dapui")

vim.o.clipboard = 'unnamedplus'

--vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = 'yes'

vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.o.updatetime = 300

vim.o.termguicolors = true

vim.o.mouse = ''

vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end, { desc = 'Telescope help tags' })


vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Breakpoint" })
vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continuar / iniciar" })
vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle dapui" })
vim.keymap.set({ "n", "v" }, "<leader>de", dapui.eval, { desc = "Evaluar" })
vim.opt.foldlevel=99
vim.keymap.set("n", "<leader>da", function()
	require("dap").run({
		type = "java",
		request = "attach",
		name = "Attach al puerto 5005",
		hostName = "127.0.0.1",
		port = 5005,
	})
end, { desc = "Java: attach 5005" })
--nnoremap <C-d> <C-d>zz
--nnoremap <C-u> <C-u>zz
