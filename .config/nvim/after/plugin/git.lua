vim.keymap.set("n", "]c", "/^\\(<<<<<<<\\)<CR>", {silent = true, desc = "Next conflict beginning"})
vim.keymap.set("n", "[c", "/?\\(<<<<<<<\\)<CR>", {silent = true, desc = "Previous conflict beginning"})
vim.keymap.set("n", "]C", "/^\\(>>>>>>>\\)<CR>", {silent = true, desc = "Next conflict end"})
vim.keymap.set("n", "[C", "/?\\(>>>>>>>\\)<CR>", {silent = true, desc = "Previous conflict end"})

-- Fugitive --
vim.keymap.set("n", "<leader>gg", vim.cmd.Git)
vim.api.nvim_create_user_command("Ours", function() vim.cmd.diffget("//2") end, {})
vim.api.nvim_create_user_command("Theirs", function() vim.cmd.diffget("//3") end, {})
