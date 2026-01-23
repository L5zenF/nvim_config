-- lua/plugins/blink.lua
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      -- 核心配置：将 Tab 映射为“选中并接受”
      -- 这样当补全菜单弹出时，按 Tab 就会直接插入当前项
      -- 如果菜单没弹出，fallback 保证它依然能用来缩进
      ["<Tab>"] = { "select_and_accept", "fallback" },

      -- (可选) 如果你不想让回车键触发补全，只想换行，取消下面这行的注释：
      -- ["<CR>"] = { "fallback" },
    },
  },
}
