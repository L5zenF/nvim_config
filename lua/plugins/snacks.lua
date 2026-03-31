return {
  {
    "folke/snacks.nvim",
    opts = {
      -- === 功能模块 ===
      words = { enabled = true },
      image = { enable = true },
      statuscolumn = { enabled = true },
      indent = { enabled = true },
      dim = { enabled = true },
      scratch = { enabled = true },
      zen = { enabled = true },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
        },
      },
      indent = {
        indent = {
          char = "│",
          only_scope = false,
          only_current = false,
        },
        scope = {
          enabled = true,
          char = "│",
          underline = false,
        },
        animate = {
          enabled = true,
          style = "out",
          duration = 200,
        },
      },
      dim = {
        scope = {
          min_size = 5,
          max_size = 40,
        },
        animate = {
          enabled = true,
          easing = "outQuad",
          duration = 200,
        },
      },
      zen = {
        toggles = {
          dim = true,
          git_signs = false,
          mini_diff_signs = false,
          diagnostics = false,
          inlay_hints = false,
        },
        show = {
          statusline = false,
          tabline = false,
        },
      },
      statuscolumn = {
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = {
          open = false,
          git_hl = false,
        },
      },
    },
    keys = {
      -- Picker
      {
        "<leader>fp",
        function()
          Snacks.picker.projects()
        end,
        desc = "Projects",
      },

      -- Zen mode
      {
        "<leader>uz",
        function()
          Snacks.zen()
        end,
        desc = "Toggle Zen Mode",
      },
      {
        "<leader>uZ",
        function()
          Snacks.zen.zoom()
        end,
        desc = "Toggle Zoom",
      },

      -- Dim
      {
        "<leader>uD",
        function()
          Snacks.dim()
        end,
        desc = "Toggle Dim",
      },

      -- Scratch buffer
      {
        "<leader>.",
        function()
          Snacks.scratch()
        end,
        desc = "Toggle Scratch Buffer",
      },
      {
        "<leader>S",
        function()
          Snacks.scratch.select()
        end,
        desc = "Select Scratch Buffer",
      },

      -- Git browse (open file on GitHub/GitLab)
      {
        "<leader>go",
        function()
          Snacks.gitbrowse()
        end,
        desc = "Open in Browser",
      },
      {
        "<leader>gO",
        function()
          Snacks.gitbrowse({ what = "permalink" })
        end,
        desc = "Open Permalink",
      },
      {
        "<leader>gB",
        function()
          Snacks.gitbrowse({ what = "branch" })
        end,
        desc = "Open Branch",
      },

      -- Buffer delete (smart, preserves layout)
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          Snacks.bufdelete({ force = true })
        end,
        desc = "Delete Buffer (Force)",
      },
      {
        "<leader>bo",
        function()
          Snacks.bufdelete.other()
        end,
        desc = "Delete Other Buffers",
      },
      {
        "<leader>ba",
        function()
          Snacks.bufdelete.all()
        end,
        desc = "Delete All Buffers",
      },

      -- GitHub CLI
      {
        "<leader>gI",
        function()
          Snacks.gh.issue()
        end,
        desc = "GitHub Issues (gh)",
      },
      {
        "<leader>gP",
        function()
          Snacks.gh.pr()
        end,
        desc = "GitHub PRs (gh)",
      },

      -- Rename file with LSP
      {
        "<leader>cR",
        function()
          Snacks.rename.rename_file()
        end,
        desc = "Rename File (LSP)",
      },
    },
  },
}
