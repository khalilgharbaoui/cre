require "cre/railtie"
require "cre/version"

module Cre
  # Fetching Rails encrypted credentials with:
  #   `Rails.application.credentials.dig(:environment, :credential)`
  # Is too long for my taste.
  # Using Cre.dig is a lot shorter:
  #   `Cre.dig(:environment, :credential)`
  # By default Rails.env finds the default environment for us when none is
  # specified and it is called with the credential only:
  #   `Cre.dig(:password)`
  # The dig method here is just an aesthetic thing to keep us in context.
  # TODO: Add support for deeply nested credentials.

  def self.dig(*credentials)
    env, credentials = if defined_environments.include? credentials[0].to_sym
      [credentials[0].to_sym, credentials[1..-1].flatten.map(&:to_sym)]
    else
      [Rails.env.to_sym, [credentials].flatten.map(&:to_sym)]
    end
    Rails.application.credentials.dig(env, *credentials)
  end

  private

  def self.defined_environments
    Dir.entries(Rails.root.join('config','environments').to_s).grep(/\.rb$/).map{ |filename| File.basename(filename, '.rb').to_sym }
  end
end
