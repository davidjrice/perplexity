# perplexity

An unofficial client for the [Perplexity AI](https://www.perplexity.ai) API.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add perplexity

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install perplexity

## Usage

1. add your `PERPLEXITY_API_KEY` to your environment variables (typically in a `.env` file)

```
PERPLEXITY_API_KEY=pplx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

2. source the `.env` file

```zsh
export $(cat .env)
```

3. Interact with `perplexity`

```ruby
messages = [
  {
    role: 'system',
    content: 'Be precise and concise'
  },
  {
    role: 'user',
    content: 'good strategy games for macOS'
  }
]

parameters = {
  model: 'sonar-small-online',
  messages: messages
}

perplexity = Perplexity::API.new(api_key: ENV.fetch('PERPLEXITY_API_KEY'))
response = perplexity.client.chat(parameters: parameters)
```

```ruby
require 'pp'
pp response
=>
{"id"=>"8db8e4d7-73ef-4313-9f74-3b08cec81139",
 "model"=>"sonar-small-online",
 "created"=>7232621,
 "usage"=>{"prompt_tokens"=>42, "completion_tokens"=>115, "total_tokens"=>157},
 "object"=>"chat.completion",
 "choices"=>
  [{"index"=>0,
    "finish_reason"=>"stop",
    "message"=>
     {"role"=>"assistant",
      "content"=>
       "Some good strategy games for macOS include \"Civilization VI,\" \"Crusader Kings III,\" \"StarCraft II,\" and \"Stellaris\". Additionally, \"Planetary Annihilation\" and \"HomeWorld Deserts of Kharak\" are mentioned as fun strategy games for macOS. Other notable strategy games for Mac include \"Company of Heroes,\" \"Warhammer,\" \"Total War series,\" \"Cities: Skylines,\" and \"FTL: Faster Than Light\"."},
    "delta"=>{"role"=>"assistant", "content"=>""}}]}```
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment with the code.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/davidjrice/perplexity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/davidjrice/perplexity/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Perplexity project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/davidjrice/perplexity/blob/main/CODE_OF_CONDUCT.md).
