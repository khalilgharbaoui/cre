$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'cre/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'cre'
  s.version     = Cre::VERSION
  s.authors     = ['Khalil Gharbaoui']
  s.email       = ['khalilgharbaoui@hotmail.com']
  s.homepage    = 'https://github.com/khalilgharbaoui/cre'
  s.summary     = 'Fetch rails credentials the easy way!'
  s.description = "Cre reduces the amount of code you have to write when\
                      fetching rails credentials.\
                      If your encrypted credentials look like this:

                      production:
                        password: 'foobar'
                      development:
                        password: 'foobar'
                      test:
                        password: 'foobar'

                      Usually you have to get it like this:
                        `Rails.application.credentials.dig(Rails.env, :password)`
                      with Cre you can just do: `Cre.dig(:password)`.
                      By default it grabs the current Rails environment.
                      To overwrite this behavior add the enviroment as the
                      first argument: `Cre.dig(:production, :password)`
                    "

  s.license     = 'MIT'

  s.files = Dir['lib/**/*.rb'] + %w[LICENSE.txt README.md CHANGELOG.md]

  s.required_ruby_version = '>= 2.7'

  # Cre has no runtime dependencies. It only calls Rails.application at
  # runtime, inside your Rails app, where Rails is already loaded.
  # (The old `rails >= 5.2` runtime dependency was removed in 2.2.0 - it
  # constrained users' bundles for no benefit.)

  s.metadata = {
    'allowed_push_host' => 'https://rubygems.org',
    'homepage_uri' => s.homepage,
    'source_code_uri' => 'https://github.com/khalilgharbaoui/cre',
    'changelog_uri' => 'https://github.com/khalilgharbaoui/cre/blob/master/CHANGELOG.md',
    'bug_tracker_uri' => 'https://github.com/khalilgharbaoui/cre/issues',
    'rubygems_mfa_required' => 'true'
  }
end
