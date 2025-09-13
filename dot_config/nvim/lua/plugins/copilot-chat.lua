-- CopilotChat.nvim
--
-- https://github.com/CopilotC-Nvim/CopilotChat.nvim
return {
  "CopilotC-Nvim/CopilotChat.nvim",
  lazy = false,
  dependencies = {
    {"github/copilot.vim"},
    {"nvim-telescope/telescope.nvim", branch = "master"},
  },
  build = "make tiktoken",
  opts = {},
  config = function()
    require("CopilotChat").setup(
      {
        -- @see https://docs.mistral.ai/capabilities/code_generation/
        -- @see https://mistral.ai/news/codestral-25-08
        model = "devstral-medium-latest",

        prompts = {
          ToUS = {
            prompt = "Translate the following text to English:",
            system_prompt = "You are a helpful assistant that translates French to English.",
          },
        },
      }
    )

    -- @see https://github.com/CopilotC-Nvim/CopilotChat.nvim/discussions/975
    require('CopilotChat.config').providers.mistral = {
      prepare_input = require('CopilotChat.config.providers').copilot.prepare_input,
      prepare_output = require('CopilotChat.config.providers').copilot.prepare_output,

      get_headers = function()
        local api_key_file = io.open(os.getenv("HOME") .. '/.mistral_api_key', 'r')
        if not api_key_file then
          error('Mistral API key file not found at ~/.mistral_api_key')
        end
        local api_key = api_key_file:read()
        api_key_file:close()
        return {
          Authorization = 'Bearer ' .. api_key,
          ['Content-Type'] = 'application/json',
        }
      end,

      get_models = function(headers)
        local response, err = require('CopilotChat.utils.curl').get('https://api.mistral.ai/v1/models', {
          headers = headers,
          json_response = true,
        })

        if err then
          error(err)
        end

        return vim.iter(response.body.data)
          :filter(function(model)
            return model.capabilities.completion_chat
          end)
          :map(function(model)
            return {
              id = model.id,
              name = model.name,
            }
          end)
          :totable()
      end,

      get_url = function()
        return 'https://api.mistral.ai/v1/chat/completions'
      end,
    }
  end,
}
