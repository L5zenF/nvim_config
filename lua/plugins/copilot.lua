return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-y>",
          dismiss = "<C-e>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        ["*"] = true,
        markdown = true,
        gitcommit = true,
        ["dap-repl"] = false,
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      model = "claude-sonnet-4-20250514",
      prompts = {
        Explain = {
          prompt = "/COPILOT_EXPLAIN 解释选中代码的工作原理",
        },
        Review = {
          prompt = "/COPILOT_REVIEW 审查选中的代码并提供改进建议",
        },
        Fix = {
          prompt = "/COPILOT_FIX 修复以下代码中的问题",
        },
        Optimize = {
          prompt = "/COPILOT_REFACTOR 优化选中代码以提高性能和可读性",
        },
        Docs = {
          prompt = "/COPILOT_GENERATE 为选中代码添加文档注释",
        },
        Tests = {
          prompt = "/COPILOT_GENERATE 为选中代码生成单元测试",
        },
      },
    },
  },
}
