return {
  {
    "kndndrj/nvim-dbee",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    build = function()
      require("dbee").install()
    end,
    cmd = { "DBee" },
    keys = {
      { "<leader>od", "<cmd>DBee<cr>", desc = "Database Client" },
    },
    opts = {
      -- 连接配置在 ~/.local/share/nvim/dbee/persistence.json 或项目 .dbee.json
    },
  },
}
