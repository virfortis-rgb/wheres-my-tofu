RubyLLM.configure do |config|
  config.openai_api_key = ENV["GITHUB_API_KEY"]
  # config.openai_api_base = "https://models.github.ai/inference/"
  config.openai_api_base = "https://api.groq.com/openai/v1"
  config.gemini_api_key = ENV["GEMINI_API_KEY"]
  # config.gemini_api_base = 'https://generativelanguage.googleapis.com/v1'
  # config.default_model = 'qwen/qwen2.5-vl-32b-instruct:free'
  # config.default_model = 'gpt-5'
end
