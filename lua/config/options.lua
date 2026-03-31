-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Editor
vim.opt.relativenumber = true -- 相对行号
vim.opt.scrolloff = 8 -- 上下滚动时保留的行数
vim.opt.sidescrolloff = 8 -- 左右滚动时保留的列数
vim.opt.wrap = false -- 不自动换行
vim.opt.signcolumn = "yes" -- 始终显示 sign column

-- Search
vim.opt.ignorecase = true -- 搜索忽略大小写
vim.opt.smartcase = true -- 搜索包含大写字母时区分大小写

-- Indent
vim.opt.smartindent = true -- 智能缩进
vim.opt.shiftround = true -- 缩进取整到 shiftwidth 的倍数
vim.opt.breakindent = true -- 换行时保持缩进

-- Fold (use Treesitter)
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99 -- 默认展开所有折叠

-- Performance
vim.opt.updatetime = 250 -- 更快的 CursorHold 事件
vim.opt.timeoutlen = 300 -- which-key 延迟
vim.opt.redrawtime = 1500 -- 重绘超时(ms)

-- File
vim.opt.undofile = true -- 持久撤销
vim.opt.backup = false -- 不创建备份文件
vim.opt.writebackup = false -- 写入时不创建备份

-- UI
vim.opt.laststatus = 3 -- 全局 statusline (neovide & terminal)
vim.opt.winborder = "rounded" -- 浮动窗口圆角边框
vim.opt.splitright = true -- 垂直分割在右侧
vim.opt.splitbelow = true -- 水平分割在下方

-- Clipboard (macOS)
vim.opt.clipboard = "unnamedplus" -- 系统剪贴板

-- Completion
vim.opt.completeopt = "menu,menuone,noselect"

-- Wildmenu
vim.opt.wildmode = "longest:full,full"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar", "*.dylib", "*.so" })

-- Disable unused providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
