# Camunda

This ruby gem is a wrapper for the Camunda API's. You will need to create a client on your Camunda cluster and use the credentials to connect.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'camundapi'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install camundapi

## Usage

This library has an opinionated approach has how the API wrapper is implemented but it follows a very similar approach for every Camunda API. All the APIs are in their own module (`Camunda::Operate`, `Camunda::Zeebe`, ..). 

Depending on which APIs you're going to use, you will have to set the right variables in the config:

```ruby
Camunda.configure do |config|
  config.client_id = ENV['ZEEBE_CLIENT_ID']
  config.client_secret = ENV['ZEEBE_CLIENT_SECRET']
  config.zeebe_audience = ENV['ZEEBE_AUDIENCE']
  config.authorization_url = ENV['ZEEBE_AUTHORIZATION_SERVER_URL']
  config.operate_base_url = ENV['CAMUNDA_OPERATE_BASE_URL']
  config.zeebe_url = ENV['ZEEBE_URL']
  config.tasklist_base_url = ENV['CAMUNDA_TASKLIST_BASE_URL']
end
```

In the `Configuarion` class you can see all the available variables and what it defaults to. 

### Operate API
Implements the API endpoints you can find [here](https://docs.camunda.io/docs/apis-clients/operate-api/). To use it with this gem, you can execute the following:

```ruby
instance = Camunda::Operate::ProcessInstances.find('key')
```

For all the endpoints here we use the similar approach of having its own class per entity (process definitions, incidents, ..) and the `search` and `find` method is always available.

### Zeebe API
Implements the API endpoints you can find [here](https://docs.camunda.io/docs/apis-clients/grpc/). It makes use of the already existing [Zeebe Ruby gem](https://github.com/zeebe-io/zeebe-client-ruby).
This part is a work in progress but the foundations are here to add other classes/methods. It follows the same approach as how we've implemented the Operate API - that is that every entity gets its own class. Use as follows:

```ruby
Camunda::Zeebe::ProcessInstances.create(process_id: 'id-of-a-process')
Camunda::Zeebe::ProcessInstances.create(process_id: 'id-of-a-process', variables: {'operational': true})
Camunda::Zeebe::ProcessInstances.create(process_id: 'id-of-a-process', variables: {'operational': true}, version: '5')
```

### Console API
Implements the API endpoints you can find [here](https://docs.camunda.io/docs/apis-clients/console-api-reference/). To use it with this gem, you can execute the following:

```ruby
clusters = Camunda::Console::Clusters.all
```

For all the endpoints here we use the similar approach of having its own class per entity (process definitions, incidents, ..) and the `search` and `find` method is always available.

### Tasklist API
Implements the API endpoints you can find [here](https://docs.camunda.io/docs/apis-clients/tasklist-api/tasklist-api-overview/).
This part is a work in progress but the foundations are here to add other classes/methods. It follows the same approach as how we've implemented the Operate API - that is that every entity gets its own class. Use as follows:

```ruby
Camunda::Tasklist::UserTasks.all
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lienvdsteen/camunda. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lienvdsteen/camunda/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Camunda project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/lienvdsteen/camunda/blob/main/CODE_OF_CONDUCT.md).
