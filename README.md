# parcel-rails

Gem integrates [parcel](https://parceljs.org/) JS module bundler into your Rails application. It is inspired by gems such as
[breakfast](https://github.com/devlocker/breakfast) or [webpacker](https://github.com/rails/webpacker).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'parcel-rails'
```

## Usage

Run

    $ bin/rails parcel:install

### Development

Currently `parcel` is not integrated with `rails s` so you need a process manager like [foreman]() to run both `rails s` and `parcel`.

Create `Procfile.dev`, with the following content:

```
web: bin/rails s
parcel: bin/rails parcel:serve
```

### Production

Gem hooks up to the assets:precompile, so no special setup is required.


### Including in view

`parcel-rails` provides set of helpers that allows you to include bundled
modules in your application

    javascript_include_tag '/parcels/application'
    stylesheet_include_tag '/parcels/application'

### Configuration

	config.parcel.entry_points = %w(app/javascript/application.js)
	config.parcel.destination = 'public/parcels'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/michaldarda/parcel-rails. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Parcel::Rails project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/parcel-rails/blob/master/CODE_OF_CONDUCT.md).

