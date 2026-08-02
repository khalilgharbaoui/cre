[![CI](https://github.com/khalilgharbaoui/cre/actions/workflows/ci.yml/badge.svg)](https://github.com/khalilgharbaoui/cre/actions/workflows/ci.yml) [![Gem Version](https://badge.fury.io/rb/cre.svg)](https://badge.fury.io/rb/cre)

# Cre

This gem basically lets you dig out the rails encrypted credentials by simply doing:

`Cre.dig(:password)` ✅

Instead of going the long way:

`Rails.application.credentials.dig(Rails.env.to_sym, :password)` ❌

Cre has **no runtime dependencies** and works on Rails 5.2 through 8.x.

## Usage

By default it uses the currently active rails environment. Specify the environment specifically by adding it as the first argument. But do remember that it only considers `defined environments` in `config/environments`

`Cre.dig(:production, :password)`

⚠️ This assumes your credentials are setup like:

```yaml
production:
  aws_key: 'somekeyproduction'
  password: 'fakepass'
development:
  aws_key: 'somekeydevelopment'
  password: 'fakepass'
test:
  aws_key: 'somekeytest'
  password: 'fakepass'
```

It also supports deeper nested credentials for example:

```ruby
Cre.dig(:production, :aws, :client, :secret, :key)
```

Or:

```ruby
Cre.dig(:something, :nested, :multiple, :layers, :deep)
```

### Good to know

- Calling `Cre.dig` outside a booted Rails application raises `Cre::Error`
  with a clear message.
- If a top-level credential key has the same name as one of your defined
  environments (e.g. a credential literally called `production`), the first
  argument is interpreted as the environment selector. Give such keys a
  different name.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cre', '~> 2.2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cre

## Changelog

See [CHANGELOG.md](CHANGELOG.md).

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
