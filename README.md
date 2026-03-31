# Neovim 企业级 IDE 配置

基于 [LazyVim](https://www.lazyvim.org/) 的企业级 Neovim 配置，对标 VSCode / Zed / JetBrains 开箱即用体验。

支持语言：**Go / Rust / Python(uv) / TypeScript / C/C++ / SQL / YAML / TOML / Markdown / Docker** 等。

---

## 目录

- [快速开始](#快速开始)
- [目录结构](#目录结构)
- [环境要求](#环境要求)
- [核心快捷键](#核心快捷键)
  - [Leader 键](#leader-键)
  - [文件与搜索](#文件与搜索)
  - [编辑](#编辑)
  - [代码导航](#代码导航)
  - [LSP 与补全](#lsp-与补全)
  - [调试 (DAP)](#调试-dap)
  - [测试 (Neotest)](#测试-neotest)
  - [Git](#git)
  - [GitHub (Octo)](#github-octo)
  - [任务运行 (Overseer)](#任务运行-overseer)
  - [终端](#终端)
  - [项目与 Session](#项目与-session)
  - [书签与跳转](#书签与跳转)
  - [UI 控制](#ui-控制)
  - [数据库](#数据库)
  - [Jira](#jira)
  - [AI](#ai)
  - [代码折叠](#代码折叠)
  - [Snippet 管理](#snippet-管理)
  - [文档生成](#文档生成)
  - [多光标](#多光标)
- [语言专项指南](#语言专项指南)
  - [Python (uv)](#python-uv)
  - [Go](#go)
  - [Rust](#rust)
- [DAP 调试配置 (launch.json)](#dap-调试配置-launchjson)
- [插件清单](#插件清单)
- [常见问题](#常见问题)

---

## 快速开始

```bash
# 1. 克隆配置
git clone <this-repo> ~/.config/nvim

# 2. 启动 Neovim（自动安装所有插件）
nvim

# 3. 等待安装完成后重启
# 首次启动会自动通过 Mason 安装 LSP/DAP/Linter/Formatter

# 4. 检查健康状态
:checkhealth
:checkhealth snacks
```

> Windows + WSL 用户请将配置放在 WSL 内的 `~/.config/nvim`。

---

## 目录结构

```
~/.config/nvim/
├── init.lua                  # 入口文件
├── lua/
│   ├── config/
│   │   ├── lazy.lua          # 插件管理（LazyVim extras 声明）
│   │   ├── autocmds.lua      # 自动命令
│   │   ├── keymaps.lua       # 全局快捷键
│   │   └── options.lua       # 编辑器选项
│   └── plugins/              # 自定义插件配置（每个文件对应一个/一组插件）
│       ├── dap.lua           # DAP 调试 + Python uv 支持
│       ├── gitsigns.lua      # Git 行内 blame
│       ├── session.lua       # Session 持久化
│       ├── snacks.lua        # Explorer/Projects/Words
│       ├── octo.lua          # GitHub PR/Issue
│       ├── diffview.lua      # Git diff 对比
│       ├── neogen.lua        # Docstring 生成
│       ├── scissors.lua      # Snippet 可视化编辑
│       ├── ufo.lua           # 代码折叠增强
│       ├── codewindow.lua    # Minimap (wfxr/minimap.vim + code-minimap)
│       ├── coverage.lua      # 测试覆盖率
│       ├── jira.lua          # Jira 集成
│       ├── dbee.lua          # 数据库客户端
│       ├── markdown-preview.lua
│       ├── multicursor.lua   # 多光标编辑
│       ├── arrow.lua         # 文件书签
│       ├── automkdir.lua     # 自动创建目录
│       ├── autosave (内置)    # 自动保存 (autocmds.lua)
│       └── ...               # 其他插件配置
├── snippets/                 # 自定义 VSCode 风格 snippet（nvim-scissors 使用）
└── lazy-lock.json            # 插件版本锁定（团队统一）
```

---

## 环境要求

| 依赖 | 用途 | 安装方式 |
|------|------|---------|
| **Neovim >= 0.9.4** | 编辑器 | `brew install neovim` |
| **Git** | 版本控制 | 系统自带 |
| **lazygit** | Git 图形化界面 | `brew install lazygit` |
| **ripgrep (rg)** | 全局搜索 | `brew install ripgrep` |
| **fd** | 文件搜索 | `brew install fd` |
| **A Nerd Font** | 图标显示 | 推荐 [JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads) |
| **gcc/clang** | Tree-sitter 编译 | Xcode Command Line Tools |
| **code-minimap** | Minimap 渲染引擎 | `cargo install --locked code-minimap` |

### Python 项目额外依赖

```bash
# uv 项目（推荐）
uv init && uv add --dev debugpy pytest

# 传统 venv
python -m venv .venv && source .venv/bin/activate
pip install debugpy pytest
```

### Go 项目额外依赖

```bash
# Delve 调试器（Mason 自动安装，也可手动）
go install github.com/go-delve/delve/cmd/dlv@latest
```

### Rust 项目额外依赖

```bash
# rust-analyzer 和 codelldb 由 Mason 自动安装
rustup component add rust-analyzer
```

---

## 核心快捷键

### Leader 键

`Leader` 键默认为 **空格 (Space)**。所有快捷键描述中 `<leader>` 即表示先按空格。

> 按 `<leader>` 后等待 300ms 会弹出 [which-key](https://github.com/folke/which-key.nvim) 菜单，显示所有可用快捷键。

### 文件与搜索

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader><space>` | n | 智能搜索文件（Smart Find Files） |
| `<leader>ff` | n | 查找文件 |
| `<leader>fr` | n | 最近打开的文件 |
| `<leader>fg` | n | 查找 Git 跟踪的文件 |
| `<leader>fb` | n | 查找打开的 Buffer |
| `<leader>fp` | n | **项目切换** |
| `<leader>fc` | n | 查找 Neovim 配置文件 |
| `<leader>/` | n | 全局 Grep 搜索 |
| `<leader>:` | n | 命令历史 |
| `<leader>e` | n | 打开/关闭文件浏览器 |
| `H` | n (explorer 内) | 切换显示/隐藏点文件（如 `.env`、`.vscode`） |
| `<C-p>` | i | 补全菜单中向上选择 |

### 编辑

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `gcc` | n | 注释/取消注释当前行 |
| `gc` | v | 注释/取消注释选中区域 |
| `gsa` | n | 添加 surrounding（如引号、括号） |
| `gsd` | n | 删除 surrounding |
| `gsr` | n | 替换 surrounding |
| `<leader>cn` | n | 生成 Docstring（Neogen） |
| `<leader>cn` | v | 为选中函数生成 Docstring |
| `J` / `K` | v | 上下移动选中行 |
| `p` | v | 粘贴但不覆盖寄存器 |
| `s` | n | Leap 跳转到任意位置 |
| `f` / `F` | n | Flash 增强 f/t 搜索 |

### 代码导航

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `gd` | n | 跳转到定义 |
| `gr` | n | 查找引用 |
| `gI` | n | 跳转到实现 |
| `gy` | n | 跳转到类型定义 |
| `K` | n | 显示 Hover 文档 |
| `<leader>ss` | n | 搜索文档符号 |
| `<leader>sS` | n | 搜索工作区符号 |
| `<leader>co` | n | 组织 Import（Python/TS） |
| `<leader>cr` | n | 重命名符号（增量预览） |
| `<leader>ca` | n | Code Action |
| `<leader>cd` | n | 行诊断信息 |
| `]d` / `[d` | n | 下一个/上一个诊断 |
| `]e` / `[e` | n | 下一个/上一个错误 |

### LSP 与补全

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<C-n>` / `<C-p>` | i | 补全菜单上下选择 |
| `<C-y>` | i | 确认补全 |
| `<Tab>` | i | 确认补全 / Snippet 下一个占位符 |
| `<S-Tab>` | i | Snippet 上一个占位符 |
| `<C-Space>` | i | 手动触发补全 |
| `<CR>` | i | 确认补全（Enter） |

补全由 **blink.cmp** 提供，支持 LSP、Snippet、Buffer 等多来源。

### 调试 (DAP)

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>dc` | n | 选择并启动调试配置 |
| `<leader>da` | n | 运行调试（可输入参数） |
| `<leader>db` | n | 切换断点 |
| `<leader>dB` | n | 条件断点 |
| `<leader>ds` | n | Step over |
| `<leader>di` | n | Step into |
| `<leader>do` | n | Step out |
| `<leader>dq` | n | 终止调试 |
| `<leader>du` | n | 打开 DAP UI |
| `<leader>dr` | n | Rust Debuggables（仅 Rust 文件） |
| `<leader>dPt` | n | 调试 Python 测试方法（仅 Python 文件） |
| `<leader>dPc` | n | 调试 Python 测试类（仅 Python 文件） |

**调试配置使用 `.vscode/launch.json`**，详见下方 [DAP 调试配置](#dap-调试配置-launchjson) 章节。

### 测试 (Neotest)

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>tt` | n | 运行最近测试 |
| `<leader>ts` | n | 运行当前文件测试 |
| `<leader>tT` | n | 停止测试 |
| `<leader>to` | n | 显示测试输出 |
| `<leader>tS` | n | 测试摘要面板 |
| `<leader>tc` | n | 切换测试覆盖率 |
| `<leader>tC` | n | 覆盖率摘要 |

### Git

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>gg` | n | 打开 LazyGit（全功能 Git 界面） |
| `<leader>gb` | n | Git Blame 行（LazyVim 默认） |
| `<leader>gdo` | n | **打开 Diffview**（全文件 diff 对比） |
| `<leader>gdc` | n | 关闭 Diffview |
| `<leader>gdh` | n | 文件变更历史 |
| `<leader>gdH` | n | 当前文件变更历史 |
| `<leader>gf` | n | 打开 GitHub permalink |
| `]h` / `[h` | n | 下一个/上一个 Git hunk |

> 每行末尾自动显示最近提交者和时间（gitsigns current_line_blame）。

### GitHub (Octo)

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>gi` | n | 列出 GitHub Issues |
| `<leader>gp` | n | 列出 Pull Requests |
| `<leader>gr` | n | 开始 Code Review |

Octo 更多命令：`:Octo issue create`、`:Octo pr create`、`:Octo review comments` 等。

### 任务运行 (Overseer)

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>oo` | n | 运行任务 |
| `<leader>ow` | n | 任务列表（toggle） |
| `<leader>ob` | n | 任务构建器 |
| `<leader>oi` | n | Overseer 信息 |
| `<leader>oq` | n | 快速操作最近任务 |
| `<leader>ot` | n | 任务操作 |
| `<leader>oc` | n | 清除缓存 |

Overseer 支持从 `.vscode/tasks.json`、`Makefile`、`just` 等自动发现任务。

### 终端

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<c-/>` | n | 打开浮动终端 |
| `<leader>ft` | n | 打开浮动终端 |

> 终端内按 `<Esc><Esc>` 回到 Normal 模式。

### 项目与 Session

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>fp` | n | **切换项目**（Telescope 项目列表） |
| `<leader>qs` | n | 恢复当前目录的 Session |
| `<leader>ql` | n | 恢复上次的 Session |
| `<leader>qd` | n | 不保存当前 Session |

> Session 在退出 Neovim 时自动保存，重新打开项目目录时自动恢复。

### 书签与跳转

**Harpoon（快速文件切换）：**

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>H` | n | 添加当前文件到 Harpoon |
| `<leader>h` | n | 打开 Harpoon 列表 |
| `<leader>1` ~ `<leader>9` | n | 跳转到第 N 个 Harpoon 文件 |

**Arrow（文件书签）：**

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `;` | n | 打开 Arrow 书签菜单 |
| `m` | n | 打开 Buffer 书签 |

### UI 控制

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>um` | n | 切换 Minimap |
| `<leader>ub` | n | 切换 Git Blame 行 |
| `<leader>uw` | n | 切换 Word Wrap |
| `<leader>ul` | n | 切换相对行号 |
| `<leader>ud` | n | 切换 Diagnostics |
| `<leader>uc` | n | 切换 Conceal |

### 数据库

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>od` | n | 打开数据库客户端 (DBee) |

连接配置放在 `~/.local/share/nvim/dbee/persistence.json` 或项目根目录 `.dbee.json`。

### Jira

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>xj` | n | 打开 Jira 面板 |

需要在环境变量中配置 `JIRA_DOMAIN`、`JIRA_EMAIL`、`JIRA_API_KEY`。

### AI

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>aa` | n | 打开 Avante AI 面板 |
| `<leader>ae` | n | AI 编辑（选中代码后使用） |

### 代码折叠

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `zR` | n | 展开所有折叠 |
| `zM` | n | 折叠所有 |
| `zr` | n | 展开除了 imports/comments 的折叠 |
| `zm` | n | 折叠一级 |
| `zp` | n | 预览光标下的折叠内容（不展开） |

> 折叠基于 Tree-sitter，imports 和 comments 默认自动折叠。

### Snippet 管理

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>sa` | n | 创建新 Snippet |
| `<leader>se` | n | 编辑已有 Snippet |
| `<leader>se` | v | 将选中内容创建为 Snippet |

> Snippet 存放在 `~/.config/nvim/snippets/`，使用 VSCode JSON 格式。

### 文档生成

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>cn` | n | 自动生成 Docstring |
| `<leader>cn` | v | 为选中函数生成 Docstring |

> 各语言使用对应的文档规范：Python → Google Style，Go → godoc，Rust → rustdoc，TS → TSDoc。

### 多光标

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<C-LeftClick>` | n | 在鼠标位置添加光标 |
| `<C-j>` | n | 在下方添加光标 |
| `<C-k>` | n | 在上方添加光标 |
| `<S-Up>` | n | 跳过上方光标 |
| `<S-Down>` | n | 跳过下方光标 |
| `<C-a>` | n | 选中所有匹配项 |
| `<C-n>` / `<C-p>` | n | 轮转光标 |
| `<C-x>` | n | 删除当前光标 |
| `<leader>a` | n | 对齐所有光标 |

### Markdown 预览

| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `<leader>cp` | n (Markdown 文件) | 在浏览器中预览 Markdown |

---

## 语言专项指南

### Python (uv)

```bash
# 创建 uv 项目
uv init my-project && cd my-project

# 安装开发依赖
uv add --dev debugpy pytest pytest-cov

# 打开 Neovim
nvim
```

**虚拟环境切换：**

1. `<leader>cv` — 选择虚拟环境（支持 uv `.venv`、conda、系统 venv）
2. 切换后 LSP/DAP/neotest 自动同步到新环境

**调试：** 在项目根目录创建 `.vscode/launch.json`：

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "python",
      "name": "Run Current File",
      "request": "launch",
      "program": "${file}",
      "cwd": "${workspaceFolder}"
    },
    {
      "type": "python",
      "name": "Pytest Current File",
      "request": "launch",
      "module": "pytest",
      "args": ["${file}", "-v", "--tb=short"],
      "cwd": "${workspaceFolder}"
    }
  ]
}
```

### Go

```bash
# 创建 Go 项目
mkdir my-project && cd my-project && go mod init my-project

# Mason 自动安装：gopls、delve、goimports、gofumpt、golangci-lint
nvim main.go
```

**调试：** `<leader>dc` 选择调试配置，或 `<leader>dr`（Rust Debuggables 类似但用于 Go）。

`.vscode/launch.json` 示例：

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "go",
      "name": "Debug Current File",
      "request": "launch",
      "mode": "debug",
      "program": "${file}"
    },
    {
      "type": "go",
      "name": "Debug Package",
      "request": "launch",
      "mode": "debug",
      "program": "${workspaceFolder}/cmd/server"
    }
  ]
}
```

### Rust

```bash
# 创建 Rust 项目
cargo init my-project && cd my-project

# Mason 自动安装：rust-analyzer、codelldb
nvim src/main.rs
```

**调试方式：**

1. `<leader>dr` — Rust Debuggables（自动检测 Cargo targets）
2. `<leader>dc` — 使用 `.vscode/launch.json` 配置

`.vscode/launch.json` 示例：

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "lldb",
      "name": "Debug Binary",
      "request": "launch",
      "program": "${workspaceFolder}/target/debug/my-project",
      "args": [],
      "cwd": "${workspaceFolder}",
      "env": { "RUST_LOG": "debug" }
    }
  ]
}
```

---

## DAP 调试配置 (launch.json)

所有语言的调试配置统一使用 VSCode 风格的 `.vscode/launch.json`，放在项目根目录即可。LazyVim 会自动加载。

**工作流程：**

1. 在项目根目录创建 `.vscode/launch.json`（参考各语言章节的模板）
2. 按 `<leader>dc` 弹出配置列表
3. 选择配置名称（如 "Debug Package"）
4. 开始调试，用 `<leader>db` 打断点

**通用配置模板：**

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "配置显示名称（出现在选择列表中）",
      "type": "语言类型",
      "request": "launch",
      "program": "${file}",
      "args": [],
      "env": {},
      "cwd": "${workspaceFolder}"
    }
  ]
}
```

**支持的变量：**

| 变量 | 含义 |
|------|------|
| `${file}` | 当前文件路径 |
| `${workspaceFolder}` | 项目根目录 |
| `${fileBasenameNoExtension}` | 当前文件名（无扩展名） |

---

## 插件清单

### 编辑器核心

| 插件 | 功能 |
|------|------|
| LazyVim | 基础框架 |
| blink.cmp | 自动补全 |
| nvim-treesitter | 语法高亮 |
| telescope.nvim | 模糊搜索 |
| snacks.nvim | Explorer/Picker/Words/Scroll/Dashboard 等 |
| which-key.nvim | 快捷键提示 |
| noice.nvim | 命令行 UI 增强 |
| lualine.nvim | 状态栏 |
| bufferline.nvim | Buffer 标签栏 |
| catppuccin | 主题 |
| dashboard-nvim | 启动页 |

### LSP 与代码质量

| 插件 | 功能 |
|------|------|
| nvim-lspconfig | LSP 配置 |
| mason.nvim | LSP/DAP/Linter/Formatter 安装管理 |
| none-ls.nvim | 外部工具集成（formatters/code actions） |
| conform.nvim | 代码格式化 |
| nvim-lint | 代码检查 |
| trouble.nvim | 诊断面板 |
| inc-rename.nvim | 增量重命名预览 |
| nvim-ts-autotag | HTML/JSX 自动关闭标签 |

### 调试与测试

| 插件 | 功能 |
|------|------|
| nvim-dap | 调试适配协议 |
| nvim-dap-ui | 调试 UI |
| nvim-dap-go | Go DAP（Delve） |
| nvim-dap-python | Python DAP（debugpy） |
| rustaceanvim | Rust DAP（codelldb） |
| neotest | 测试框架 |
| neotest-python | Python 测试 |
| neotest-golang | Go 测试 |
| nvim-coverage | 测试覆盖率可视化 |

### Git 与 GitHub

| 插件 | 功能 |
|------|------|
| gitsigns.nvim | Git 标记 + 行内 blame |
| lazygit.nvim | LazyGit 集成 |
| mini-diff | 内联 diff |
| diffview.nvim | 全文件 diff 对比 |
| octo.nvim | GitHub PR/Issue 管理 |

### 工作流

| 插件 | 功能 |
|------|------|
| overseer.nvim | 任务运行器 |
| persistence.nvim | Session 管理 |
| harpoon (harpoon2) | 快速文件跳转 |
| arrow.nvim | 文件书签 |
| nvim-scissors | Snippet 可视化编辑 |
| neogen | Docstring 生成 |
| nvim-ufo | 代码折叠增强 |
| minimap.vim + code-minimap | Minimap（Rust 高性能渲染） |
| jira.nvim | Jira 集成 |

### 语言支持

| 插件 | 语言 |
|------|------|
| gopls + delve + goimports + gofumpt | Go |
| rust-analyzer + codelldb + crates.nvim | Rust |
| pyright + ruff + debugpy + venv-selector | Python |
| typescript-language-server | TypeScript/JavaScript |
| clangd | C/C++ |
| sqls | SQL |
| yaml-language-server | YAML |
| taplo | TOML |
| markdown-preview.nvim | Markdown |
| cmake-tools.nvim | CMake |
| kulala.nvim | HTTP REST 客户端 |

### 编辑增强

| 插件 | 功能 |
|------|------|
| mini.pairs | 自动配对括号 |
| mini.surround | Surround 操作 |
| mini.comment | 注释 |
| multicursor.nvim | 多光标编辑 |
| nvim-spider | 改进的 w/e/b 移动 |
| rainbow-delimiters.nvim | 彩虹括号 |
| text-case.nvim | 文本大小写转换 |
| yanky.nvim | 剪贴板历史 |
| flash.nvim / leap.nvim | 快速跳转 |
| todo-comments.nvim | TODO 高亮与搜索 |
| automkdir.nvim | 自动创建目录 |
| autosave (autocmds.lua) | 自动保存 |
| dial.nvim | 增量/减量切换 |

### UI 与可视化

| 插件 | 功能 |
|------|------|
| edgy.nvim | 面板布局管理 |
| aerial.nvim / outline.nvim | 代码大纲 |
| treesitter-context | 当前上下文显示（函数名悬浮） |
| smear-cursor.nvim | 光标动画 |
| mini.files | 文件浏览器（备选） |
| mini.hipatterns | 高亮模式 |

### AI

| 插件 | 功能 |
|------|------|
| avante.nvim | AI 编码助手 |

### 数据库

| 插件 | 功能 |
|------|------|
| nvim-dbee | 交互式数据库客户端 |

---

## 常见问题

### Q: 首次启动很慢？

首次启动需要下载所有插件和 Mason 工具（LSP、DAP 等），约 2-5 分钟。后续启动在 100ms 以内。

### Q: LSP 没有生效？

1. 运行 `:Mason` 检查对应 LSP 是否安装成功
2. 运行 `:LspInfo` 查看当前 buffer 的 LSP 状态
3. 运行 `:checkhealth` 查看整体健康状态

### Q: Python 补全/调试找不到虚拟环境？

1. 确保项目有 `.venv` 目录（`uv sync` 或 `python -m venv .venv`）
2. 按 `<leader>cv` 手动选择虚拟环境
3. 确保 `.venv/bin/python` 存在

### Q: 如何添加自定义 Snippet？

1. 按 `<leader>sa`（新建）或 `<leader>se`（编辑）打开 Snippet 编辑器
2. 或直接编辑 `~/.config/nvim/snippets/` 下的 JSON 文件

### Q: 如何添加新语言支持？

在 `lua/config/lazy.lua` 中添加对应的 extra：

```lua
{ import = "lazyvim.plugins.extras.lang.java" },
```

重启 Neovim 后自动安装。

### Q: 如何添加项目级配置？

在项目根目录创建 `.nvim.lua` 文件，Neovim 会自动加载：

```lua
-- .nvim.lua（项目级配置，可加入 .gitignore）
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
```

### Q: Explorer 里看不到 .env / .vscode 文件？

在 Explorer 中按 `H` 键切换隐藏文件显示。默认已开启。

### Q: 调试时选择不了配置？

1. 确保项目根目录有 `.vscode/launch.json`
2. 确保文件类型匹配（如 Go 文件中 `type` 必须为 `"go"`）
3. 运行 `:DapSetLogLevel TRACE` 查看调试日志

### Q: 如何更新所有插件？

```vim
:Lazy sync
:MasonUpdate
```

### Q: 如何重置配置？

```bash
rm -rf ~/.local/share/nvim    # 删除插件数据
rm -rf ~/.local/state/nvim    # 删除状态数据（含 session）
rm -rf ~/.cache/nvim          # 删除缓存
# 重启 Neovim，自动重新安装
```

---

## 相关资源

- [LazyVim 官方文档](https://www.lazyvim.org/)
- [LazyVim Keymaps](https://www.lazyvim.org/keymaps)
- [Neovim 官方文档](https://neovim.io/doc/)
- [awesome-neovim](https://github.com/rockerBOO/awesome-neovim)
- [neovimcraft 插件搜索](https://neovimcraft.com/)
