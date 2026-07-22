return {
    {
	"neovim/nvim-lspconfig",
	config = function()
	    -- Lua LS
	    vim.lsp.config("lua_ls", {
		cmd = { "lua-language-server" },
		filetypes = { "lua" },
		root_markers = { ".git", ".luarc.json" },
	    })
	    vim.lsp.enable("lua_ls")

	    -- Pyright
	    vim.lsp.config("pyright", {
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		root_markers = { ".git", "pyproject.toml", "setup.py" },
	    })
	    vim.lsp.enable("pyright")


	    vim.keymap.set('n','K',vim.lsp.buf.hover,{})
	    vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
	    vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action,{})
	end,
    },
}


