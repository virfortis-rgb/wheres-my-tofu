RubyLLM.configure do |config|
  config.openai_api_key = ENV["GITHUB_API_KEY"]
  config.openai_api_base = "https://models.github.ai/inference/"
  config.default_model = 'gpt-4.1-nano'
end
