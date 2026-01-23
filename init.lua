-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- neovide
if vim.g.neovide then
  vim.print(vim.g.neovide_version)

  -- font
  vim.o.guifont = "Maple Mono NF CN"
  vim.g.neovide_scale_factor = 1.1
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- transpartent
  vim.g.neovide_normal_opacity = 0.95
  -- blur
  -- vim.g.neovide_floating_blur_amount_x = 5.0
  -- vim.g.neovide_floating_blur_amount_y = 5.0
  -- vim.g.neovide_macos_simple_fullscreen = true
  vim.g.neovide_remember_window_size = true
  -- vim.g.neovide_profiler = true
  vim.g.neovide_cursor_vfx_mode = "torpedo"

  --- paste
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode

  -- ai support
  vim.opt.laststatus = 3
end
