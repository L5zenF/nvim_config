return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  version = false,
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = "openai",
    auto_suggestions_provider = "openai",

    behaviour = {
      auto_suggestions = true,
      auto_add_current_file = false,
    },

    suggestion = {
      debounce = 600,
      throttle = 600,
    },

    providers = {
      openai = {
        endpoint = "http://127.0.0.1:1337/v1",
        model = "Qwen3_5-4B_Q4_K_M",
        timeout = 30000,
        extra_request_body = {
          temperature = 0.3,
          max_tokens = 4096,
        },
      },
    },
  },
}
