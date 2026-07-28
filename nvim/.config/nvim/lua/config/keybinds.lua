vim.g.mapleader = " "

-- Edit Neovim config
vim.keymap.set("n", "<leader>ev", function()
	vim.cmd("edit " .. vim.fn.stdpath("config") .. "/.")
end, { desc = "Edit Neovim config" })

-- Toggle NvimTree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })

-- Find current file in NvimTree
vim.keymap.set("n", "<leader>m", ":NvimTreeFindFile<CR>", { silent = true, desc = "Find file in NvimTree" })

-- Switch Panes
vim.keymap.set("n", "<C-Space>", "<C-w>w")

-- Save file with Ctrl+s in Normal mode
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
