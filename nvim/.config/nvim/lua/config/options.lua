vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
-- Auto-save when leaving insert mode or losing focus
vim.api.nvim_create_autocmd({"InsertLeave", "FocusLost"}, {
  pattern = "*",
  command = "silent! write"
})

