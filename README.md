# Pushable::Rails

Send model updates to Pusher

## Installation

Add this line to your application's Gemfile:

    gem 'pushable-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pushable-rails

## Usage

Include the `Pushable` module in your activerecord models like this:

```ruby
class DummyModel < ActiveRecord::Base
  include Pushable
end
```

Now every time you create, update or destroy `DummyModel`s your app will send the corresponding notifications to pusher.

Channel: `pusher`

Events:

- Create
'dummy_model.destroy'

- Update
'dummy_model.update'

- Destroy
'dummy_model.destroy'

The payload will be the output of the model instance `to_json`. If defined, a serializer will be used (eg. `DummyModelSerializer`).

## Contributing

1. Fork it ( http://github.com/<my-github-username>/pushable-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
