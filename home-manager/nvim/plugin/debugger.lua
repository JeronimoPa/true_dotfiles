local dap = require("dap")
local dapui = require("dapui")

-- Interfaz
dapui.setup()

-- Abrir/cerrar dapui automáticamente
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- Adaptador: gdb con soporte DAP nativo (gdb >= 14)
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

-- Configuración para C y C++
dap.configurations.c = {
  {
    name = "Lanzar ejecutable",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Ejecutable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
  },
}
dap.configurations.cpp = dap.configurations.c

-- Atajos
