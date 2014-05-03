# pushable-rails

Send model updates to Pusher

## Installation

Add this line to your application's Gemfile:

    gem 'pushable-rails', require: 'pushable'

And then execute:

    $ bundle

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
`dummy_model.destroy`

- Update
`dummy_model.update`

- Destroy
`dummy_model.destroy`

The payload will be the output of the model instance `to_json`. If defined, a serializer will be used (eg. `DummyModelSerializer`).

Including `Pushable` will also add `client_id` as a virtual attribute. Your client can use this attribute to distinguish not yet saved records.
To add the `client_id` attribute to the model json you can include `PushableSerializer` in your `ActiveModel::Serializer`s, like this:

```ruby
class DummyModelSerializer < ActiveModel::Serializer
  include PushableSerializer
end
```

## Contributing

1. Fork it ( http://github.com/matteodepalo/pushable-rails/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
