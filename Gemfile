# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in jbuilder-schema.gemspec
gemspec

gem "rake", "~> 13.0"

gem "standard", "~> 1.3"

gem "mocha"

gem "ostruct"
gem "bigdecimal"

rails_version = ENV.fetch("RAILS_VERSION", "7.0")

sqlite3_version = if rails_version == "main" || Gem::Version.new(rails_version) >= "7.1"
  "~> 2.1"
else
  "~> 1.4"
end

gem "sqlite3", sqlite3_version

rails_constraint = if rails_version == "main"
  {github: "rails/rails"}
else
  "~> #{rails_version}.0"
end

gem "rails", rails_constraint
