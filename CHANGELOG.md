# Changelog

## 2.2.0 (2026-08-02)

No API changes. `Cre.dig` behaves exactly as before.

### Changed

- **Removed the `rails` runtime dependency.** Cre only ever touches
  `Rails.application` at call time, inside your Rails app, where Rails is
  already loaded. The gem now declares no runtime dependencies at all, so it
  no longer constrains the Rails version in your bundle. Cre continues to
  work on Rails 5.2 through 8.x (CI covers 6.1 through 8.1).
- `Cre::Railtie` (an empty class) is no longer loaded by default. The
  constant is still defined when Rails is present, for backward
  compatibility, and will be removed in 3.0.
- `Cre.defined_environments` is now memoized and uses `Dir.glob`, so it no
  longer re-reads the directory on every call and no longer raises if
  `config/environments` is missing.

### Added

- `Cre::Error` is raised with a clear message when `Cre.dig` is called
  outside a booted Rails application (previously a bare `NameError`).
- `Cre.dig` with no arguments now returns `nil` (previously raised
  `NoMethodError`).
- CI on GitHub Actions across Ruby 2.7-3.4 and Rails 6.1-8.1 (replaces
  Travis).

### Housekeeping

- `Gemfile.lock`, `coverage/` and `.rspec_status` are no longer committed;
  this also retires the long queue of automated lockfile security PRs,
  which only ever flagged the development dependencies of the test app.
- The spec dummy app boots on railties alone (no more ActiveRecord/sqlite3
  in the development dependencies).
- Gemspec metadata added (`changelog_uri`, `source_code_uri`,
  `required_ruby_version >= 2.7`, `rubygems_mfa_required`).
