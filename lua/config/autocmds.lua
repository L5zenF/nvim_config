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
-- Avoid saving on every text change to reduce formatter/linter/test churn.
local autosave_group = vim.api.nvim_create_augroup("auto_save", { clear = true })
local autosave_timer = nil

local function should_autosave(buf)
  return vim.api.nvim_buf_is_valid(buf)
    and vim.bo[buf].modified
    and vim.bo[buf].buftype == ""
    and vim.bo[buf].modifiable
    and not vim.bo[buf].readonly
    and vim.api.nvim_buf_get_name(buf) ~= ""
end

local function schedule_autosave(buf)
  if autosave_timer then
    autosave_timer:stop()
    autosave_timer:close()
    autosave_timer = nil
  end

  autosave_timer = vim.uv.new_timer()
  autosave_timer:start(300, 0, vim.schedule_wrap(function()
    if should_autosave(buf) then
      vim.api.nvim_buf_call(buf, function()
        vim.cmd("silent! write")
      end)
    end
    if autosave_timer then
      autosave_timer:stop()
      autosave_timer:close()
      autosave_timer = nil
    end
  end))
end

vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost", "BufLeave" }, {
  group = autosave_group,
  callback = function(args)
    schedule_autosave(args.buf)
  end,
})

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
