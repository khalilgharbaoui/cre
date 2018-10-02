$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'cre/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'cre'
  s.version     = Cre::VERSION
  s.authors     = ['Khalil Gharbaoui']
  s.email       = ['khalilgharbaoui@hotmail.com']
  s.homepage    = 'https://rubygems.org/cre'
  s.summary     = 'Fetch rails credentials the easy way!'
  s.description = "Cre reduces the amount of code you have to write when\
                      fetching rails credentials.\
                      If your encrypted credentials look like this:
                      ```
                      production:
                        password: 'foobar'
                      development:
                        password: 'foobar'
                      test:
                        password: 'foobar'
                      ```
                      Usually you have to get it like this:
                        `Rails.application.credentials.dig(Rails.env, :password)`
                      with Cre you can just do: `Cre.dig(:password)`.
                      By default it grabs the current Rails environment.
                      To overwrite this behavior add the enviroment as the
                      first argument:
                        `Cre.dig(:production, :password)`
                    "

  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 5.2.1'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end
end
