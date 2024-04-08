# frozen_string_literal: true

require_relative "lib/perplexity/version"

Gem::Specification.new do |spec|
  spec.name = "perplexity"
  spec.version = Perplexity::VERSION
  spec.authors = ["David Rice"]
  spec.email = ["me@davidjrice.co.uk"]

  spec.summary = "Client for the Perplexity AI API"
  spec.description = "OpenAI based API client for the Perplexity AI API"
  spec.homepage = "https://github.com/davidjrice/perplexity"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org'"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  # TODO: make gem executable as a command line tool
  # spec.bindir = "exe"
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ruby-openai", "~> 6.5.0"
end
