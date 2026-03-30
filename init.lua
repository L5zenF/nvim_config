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
end
