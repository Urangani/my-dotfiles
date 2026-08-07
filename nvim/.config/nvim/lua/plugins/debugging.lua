return {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
	"rcarriga/nvim-dap-ui",
	"nvim-neotest/nvim-nio",
	"jay-babu/mason-nvim-dap.nvim",
	"theHamsta/nvim-dap-virtual-text",
    },

    config = function()
	local dap, dapui = require("dap"), require("dapui")
	dap.listeners.before.attach.dapui_config = function()
	    dapui.open()
	end
	dap.listeners.before.launch.dapui_config = function()
	    dapui.open()
	end
	dap.listeners.before.event_terminated.dapui_config = function()
	    dapui.close()
	end
	dap.listeners.before.event_exited.dapui_config = function()
	    dapui.close()
	end


	vim.keymap.set("n","<leader>dt",dap.toggle_breakpoint,{})
	vim.keymap.set("n","<leader>dt",dap.continue,{})
    end,
}
