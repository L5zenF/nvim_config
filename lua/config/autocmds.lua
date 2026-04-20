-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 打开文件时自动定位到上次编辑位置
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    if mark[1] > 0 and mark[1] <= vim.api.nvim_buf_line_count(0) then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- 保存前确保父目录存在，替代 automkdir 插件。
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(args)
    local path = vim.api.nvim_buf_get_name(args.buf)
    if path == "" then
      return
    end
    local dir = vim.fn.fnamemodify(path, ":p:h")
    if vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p")
    end
  end,
})

-- Auto-save with debounce on common "done editing" transitions.

-- 大文件性能优化 (>1MB)
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function()
    local size = vim.fn.getfsize(vim.fn.expand("<afile>"))
    if size > 1024 * 1024 then
      vim.opt_local.eventignore = "all"
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.undofile = false
    end
  end,
})

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
