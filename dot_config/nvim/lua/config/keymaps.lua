-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { nowait = true, desc = "enter command mode" })

-- Save file
-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { noremap = true, desc = "Save window" })
