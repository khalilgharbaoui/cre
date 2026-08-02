require "cre/version"
require "cre/railtie" if defined?(::Rails::Railtie)

module Cre
  # Raised when Cre is used outside a booted Rails application.
  Error = Class.new(StandardError)

  # Fetching Rails encrypted credentials with:
  #   `Rails.application.credentials.dig(:environment, :credential)`
  # Is too long for my taste.
  # Using Cre.dig is a lot shorter:
  #   `Cre.dig(:environment, :credential)`
  # By default Rails.env finds the default environment for us when none is
  # specified and it is called with the credential only:
  #   `Cre.dig(:password)`
  # The dig method here is just an aesthetic thing to keep us in context.

  def self.dig(*credentials)
    ensure_rails_application!
    return nil if credentials.empty?

    env, credentials = if defined_environments.include? credentials[0].to_sym
      [credentials[0].to_sym, credentials[1..-1].flatten.map(&:to_sym)]
    else
      [Rails.env.to_sym, [credentials].flatten.map(&:to_sym)]
    end
    Rails.application.credentials.dig(env, *credentials)
  end

  def self.ensure_rails_application!
    return if defined?(::Rails) && ::Rails.respond_to?(:application) && ::Rails.application

    raise Error, "Cre requires a booted Rails application " \
                 "(Rails.application is not available)."
  end
  private_class_method :ensure_rails_application!

  # NOTE: kept public for backward compatibility - the historic `private`
  # keyword never applied to `def self.` methods, so this was always
  # callable.
  def self.defined_environments
    @defined_environments ||=
      Dir.glob(Rails.root.join("config", "environments", "*.rb"))
         .map { |filename| File.basename(filename, ".rb").to_sym }
  end
end
