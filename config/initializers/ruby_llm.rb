RubyLLM.configure do |config|
  config.azure_api_key = ENV["GITHUB_API_KEY"]
  # config.openai_api_base = "http://localhost:3000/v1"
end
