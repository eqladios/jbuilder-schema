# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in jbuilder-schema.gemspec
gemspec

# Development/test dependencies
gem "rake", "~> 13.0"
gem "standard", "~> 1.3"
gem "mocha"

rails_version = ENV.fetch("RAILS_VERSION", "7.0")

sqlite3_version = if (rails_version == "main" || Gem::Version.new(rails_version) >= Gem::Version.new("7.1") && Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("3.1"))
  "~> 2.1"
else
  "~> 1.4"
end

gem "sqlite3", sqlite3_version

rails_constraint =
  if rails_version == "main"
    { github: "rails/rails" }
  else
    "~> #{rails_version}.0"
  end

gem "rails", rails_constraint

# Ensure Rails-5 CI lanes don’t pick a broken jbuilder
if rails_version != "main" && Gem::Version.new(rails_version) < Gem::Version.new("6.0")
  gem "jbuilder", "< 2.13" # "~> 2.11.5" is safe
end
