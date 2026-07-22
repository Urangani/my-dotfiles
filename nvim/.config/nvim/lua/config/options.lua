vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.optmouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.runtimepath:append(vim.fn.stdpath("data") .. "/site")
-- Auto-save when leaving insert mode or losing focus
vim.api.nvim_create_autocmd({"InsertLeave", "FocusLost"}, {
  pattern = "*",
  command = "silent! write"
})






