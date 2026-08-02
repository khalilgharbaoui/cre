source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# The gem itself has no runtime dependencies (see cre.gemspec).
gemspec

# Development / test only. Rails is needed to boot the dummy app the specs
# run against; CI sets RAILS_VERSION to test the supported matrix.
rails_version = ENV['RAILS_VERSION']
if rails_version && !rails_version.empty?
  gem 'rails', "~> #{rails_version}.0"

  # Rails < 7.1 fails to load with concurrent-ruby >= 1.3.5
  # (uninitialized constant ActiveSupport::LoggerThreadSafeLevel::Logger),
  # a known ecosystem issue when resolving old Rails without a lockfile.
  gem 'concurrent-ruby', '< 1.3.5' if rails_version.to_f < 7.1
else
  gem 'rails', '>= 6.1'
end

gem 'rake'
gem 'rspec', '>= 3.8'
