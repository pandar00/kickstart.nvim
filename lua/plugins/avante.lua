return {
  "yetone/avante.nvim",
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- ⚠️ must add this setting! ! !
  build = "make",
  event = "VeryLazy",
  version = false, -- Never set this value to "*"! Never!
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    -- add any opts here
    -- this file can contain specific instructions for your project
    instructions_file = "avante.md",
    mode = "legacy",
    provider = "claude-code",
    acp_providers = {
      ["claude-code"] = {
        command = "npx",
        args = { "@zed-industries/claude-code-acp" },
        env = {
          NODE_NO_WARNINGS = "1",
          ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
        },
      },
    },
    providers = {
      -- ["mimo-v2-flash"] = {
      --   endpoint = "https://api.xiaomimimo.com/v1/chat/completions", -- The full endpoint of the provider
      --   model = "mimo-v2-flash", -- The model name to use with this provider
      --   api_key_name = "AVANTE_XIAOMI_FLASH_API_KEY", -- The name of the environment variable that contains the API key
      --   ---@type fun(opts: AvanteProvider, code_opts: AvantePromptOptions): AvanteCurlOutput
      --   parse_curl_args = function(opts, code_opts) end,
      --   --- This function will be used to parse incoming SSE stream
      --   --- It takes in the data stream as the first argument, followed by SSE event state, and opts
      --   --- retrieved from given buffer.
      --   --- This opts include:
      --   --- - on_chunk: (fun(chunk: string): any) this is invoked on parsing correct delta chunk
      --   --- - on_complete: (fun(err: string|nil): any) this is invoked on either complete call or error chunk
      --   ---@type fun(data_stream: string, event_state: string, opts: ResponseParser): nil
      --   parse_response = function(data_stream, event_state, opts) end,
      --   --- The following function SHOULD only be used when providers doesn't follow SSE spec [ADVANCED]
      --   --- this is mutually exclusive with parse_response_data
      --   ---@type fun(data: string, handler_opts: AvanteHandlerOptions): nil
      --   parse_stream_data = function(data, handler_opts) end,
      -- },
      openai = {
        endpoint = "https://api.xiaomimimo.com/v1",
        auth_type = "api", -- Set to "max" to sign in with Claude Pro/Max subscription
        model = "mimo-v2-flash",
        -- extra_request_body = {
        --   temperature = 0.75,
        --   max_tokens = 4096,
        -- },
      },
      -- claude = {
      --   endpoint = "https://api.anthropic.com",
      --   model = "claude-sonnet-4-20250514",
      --   timeout = 30000, -- Timeout in milliseconds
      --   extra_request_body = {
      --     temperature = 0.75,
      --     max_tokens = 20480,
      --   },
      -- },
      -- moonshot = {
      --   endpoint = "https://api.moonshot.ai/v1",
      --   model = "kimi-k2-0711-preview",
      --   timeout = 30000, -- Timeout in milliseconds
      --   extra_request_body = {
      --     temperature = 0.75,
      --     max_tokens = 32768,
      --   },
      -- },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-mini/mini.pick", -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    -- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "saghen/blink.cmp",
    "ibhagwan/fzf-lua", -- for file_selector provider fzf
    "stevearc/dressing.nvim", -- for input provider dressing
    "folke/snacks.nvim", -- for input provider snacks
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
