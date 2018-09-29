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

  def self.dig(env = Rails.env.to_sym, credential)
    Rails.application.credentials.dig(
      env.to_sym,
      credential.to_sym
    )
  end
end
