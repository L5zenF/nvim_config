return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    {
      "<leader>ft",
      "<cmd>ToggleTerm direction=float<cr>",
      desc = "ToggleTerm (float)",
      mode = { "n" },
    },
    {
      "<leader>fT",
      "<cmd>ToggleTerm direction=horizontal<cr>",
      desc = "ToggleTerm (horizontal)",
      mode = { "n" },
    },
  },
  opts = {
    direction = "float",
    hide_numbers = true,
    start_in_insert = true,
    close_on_exit = true,
    shade_terminals = false,
    float_opts = {
      border = "curved",
      winblend = 0,
    },
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    -- Terminal mode keymaps
    function _G.set_terminal_keymaps()
      local buf_opts = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], buf_opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], buf_opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], buf_opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], buf_opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], buf_opts)
    end

    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "term://*",
      callback = _G.set_terminal_keymaps,
    })
  end,
}
