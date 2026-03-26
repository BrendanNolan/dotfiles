-- Fugitive --
vim.keymap.set("n", "<leader>gg", vim.cmd.Git);
vim.keymap.set("n", "<leader>ch", "<cmd>diffget //2<CR>");
vim.keymap.set("n", "<leader>cl", "<cmd>diffget //3<CR>");

vim.keymap.set("n", "]c", "/^\\(<<<<<<<\\)<CR>", {silent = true, desc = "Next conflict beginning"})
vim.keymap.set("n", "]c", "/?\\(<<<<<<<\\)<CR>", {silent = true, desc = "Previous conflict beginning"})
vim.keymap.set("n", "]C", "/^\\(>>>>>>>\\)<CR>", {silent = true, desc = "Next conflict end"})
vim.keymap.set("n", "]C", "/?\\(>>>>>>>\\)<CR>", {silent = true, desc = "Previous conflict end"})
