-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 不覆盖 LazyVim 默认快捷键，仅补充缺失的功能

-- Clear search highlight
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear search highlight" })

-- Move lines in visual mode (VSCode-like)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Better paste (keep register content)
vim.keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Join lines without moving cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Better scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half-page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half-page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Quickfix navigation (complements LazyVim's <leader>xq)
vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
