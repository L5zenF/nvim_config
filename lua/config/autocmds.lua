-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Fix file type detection for uppercase file extensions
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function()
    local ext = vim.fn.expand("%:e")
    if ext:match("^[A-Z]+$") then
      local ft = vim.filetype.match({ filename = vim.fn.expand("%:t:r") .. "." .. ext:lower() })
      if ft then
        vim.bo.filetype = ft
      end
    end
  end,
})
