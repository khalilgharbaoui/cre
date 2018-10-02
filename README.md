[![Build Status](https://travis-ci.org/khalilgharbaoui/cre.svg?branch=master)](https://travis-ci.org/khalilgharbaoui/cre)
# Cre
This gem basically lets you dig out the rails encrypted credentials by simply doing:

`Cre.dig(:password)` ✅

Instead of going the long way:

`Rails.application.credentials.dig(Rails.env.to_sym, :password)` ❌

## Usage
By default it uses the currently active rails environment.
Specify the environment specifically by adding it as the first argument.

`Cre.dig(:production, :password)`

⚠️ This assumes your credentials are setup like:
```
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
## Installation
Add this line to your application's Gemfile:

```ruby
gem 'cre', '~> 0.1.2'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install cre
```

##Todo:
- Add support for more and less levels of nesting.
- Exeption handeling

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
