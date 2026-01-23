-- lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    -- Space f t 打开/关闭一个“默认悬浮”的终端
    {
      "<leader>ft",
      "<cmd>ToggleTerm direction=float<cr>",
      desc = "ToggleTerm (float)",
      mode = { "n", "i" }, -- Normal 和 Insert 模式都能用
    },
  },
  opts = {
    -- 不用 open_mapping 了，因为我们用上面的 <leader>ft 主动触发
    direction = "float", -- 默认是悬浮<span data-allow-html class='source-item source-aggregated' data-group-key='source-group-1' data-url='https://blog.csdn.net/gitblog_01004/article/details/154401702' data-id='turn0search3'><span data-allow-html class='source-item-num' data-group-key='source-group-1' data-id='turn0search3' data-url='https://blog.csdn.net/gitblog_01004/article/details/154401702'><span class='source-item-num-name' data-allow-html>csdn.net</span><span data-allow-html class='source-item-num-count'>+1</span></span></span>
    hide_numbers = true,
    insert_mappings = true, -- Insert 模式里也支持相关快捷键（比如其他终端的切分）
    terminal_mappings = true,
    start_in_insert = true, -- 打开终端后直接进入 Insert 模式
    close_on_exit = true, -- shell 退出后自动关闭终端
    shade_terminals = false, -- 不喜欢背景变暗就保持 false
  },
}
