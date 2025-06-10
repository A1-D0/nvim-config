vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")  
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")  

-- half-page scrolling with cursor in the middle of the page
vim.keymap.set("n", "<C-d>", "<C-d>zz")  
vim.keymap.set("n", "<C-u>", "<C-u>zz")  

-- text searching visual convenience
vim.keymap.set("n", "n", "nzzzv")  
vim.keymap.set("n", "N", "Nzzzv")  

-- convenient hotkey for not reusing deleted word after pasting over highlighted word 
vim.keymap.set("x", "<leader>p", "\"_dP")  

-- copy and paste
vim.keymap.set("n", "<leader>y", "\"+y")  
vim.keymap.set("v", "<leader>y", "\"+y")  
vim.keymap.set("n", "<leader>Y", "\"+Y")  
