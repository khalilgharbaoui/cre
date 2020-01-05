# frozen_string_literal: true

# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require_relative '../spec/dummy/config/environment'
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../spec/dummy/db/migrate', __dir__)]

require 'bundler/setup'
require 'rails/test_help'
require 'simplecov'
SimpleCov.start do
  add_filter '/spec/'
end
require 'pry'
require 'awesome_print'
AwesomePrint.pry!
require 'cre'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
    c.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  # This option will default to `:apply_to_host_groups` in RSpec 4 (and will
  # have no way to turn it off -- the option exists only for backwards
  # compatibility in RSpec 3). It causes shared context metadata to be
  # inherited by the metadata hash of host groups and examples, rather than
  # triggering implicit auto-inclusion in groups with matching metadata.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random
end
