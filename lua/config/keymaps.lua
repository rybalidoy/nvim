-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Resize windows with Ctrl + arrow keys (mapped to hjkl)
-- Add these to your keymaps.lua
local keymap = vim.keymap

keymap.set("n", "<C-k>", ":resize +2<CR>", { desc = "Resize split up" })
keymap.set("n", "<C-j>", ":resize -2<CR>", { desc = "Resize split down" })
keymap.set("n", "<C-h>", ":vertical resize -2<CR>", { desc = "Resize split left" })
keymap.set("n", "<C-l>", ":vertical resize +2<CR>", { desc = "Resize split right" })
