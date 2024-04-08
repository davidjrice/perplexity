# frozen_string_literal: true

require "openai"
require_relative "perplexity/version"

module Perplexity
  class Error < StandardError; end
  class ConfigurationError < Error; end

  # Public: Perplexity AI API client
  class API
    attr_writer :api_key

    DEFAULT_URI_BASE = "https://api.perplexity.ai"
    DEFAULT_REQUEST_TIMEOUT = 120
    MODELS = %w[
      sonar-small-chat
      sonar-small-online
      sonar-medium-chat
      sonar-medium-online
      codellama-70b-instruct
      mistral-7b-instruct
      mixtral-8x7b-instruct
    ].freeze

    def initialize(api_key: nil)
      @api_key = api_key
      configure!
    end

    def configure!
      raise ConfigurationError, "API key is required" unless @api_key

      OpenAI.configure do |config|
        config.access_token = @api_key
        config.uri_base = DEFAULT_URI_BASE
        config.api_version = "" # NOTE: Perplexity API URLs are not versioned
        config.extra_headers = { "Content-Type" => "application/json" }
      end
    end

    def client
      @client ||= OpenAI::Client.new
    end

    def models
      MODELS
    end
  end
end
