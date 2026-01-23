-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 打开/关闭浮动终端
-- vim.keymap.set("n", "<leader>ft", ":FloatermToggle<CR>", { desc = "Toggle floating terminal" })
-- 新建终端
-- vim.keymap.set("n", "<leader>fn", ":FloatermNew<CR>", { desc = "New floating terminal" })
--

-- 终端 esc 退出
-- vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })
-- tab 补全

-- if not vim.g.vscode then
--   local cmp = require("cmp")
--   cmp.setup({
--     mapping = {
--       ["<Tab>"] = cmp.mapping(function(fallback)
--         if cmp.visible() then
--           cmp.confirm({ select = true })
--         else
--           fallback() -- 未触发补全时，执行默认 Tab 行为（缩进）
--         end
--       end, { "i", "s" }),
--     },
--   })
-- end
