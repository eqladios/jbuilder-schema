# frozen_string_literal: true

require_relative "lib/jbuilder/schema/version"

Gem::Specification.new do |spec|
  spec.name = "jbuilder-schema"
  spec.version = JBUILDER_SCHEMA_VERSION
  spec.authors = ["Yuri Sidorov"]
  spec.email = ["git@yurisidorov.com"]

  spec.summary = "Generate JSON Schema from Jbuilder files"
  spec.description = spec.summary
  spec.homepage = "https://github.com/bullet-train-co/jbuilder-schema"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .standard.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Runtime dependencies
  spec.add_dependency "activesupport", ">= 5.0"
  spec.add_dependency "actionview",    ">= 5.0"
  spec.add_dependency "railties",      ">= 5.0"
  spec.add_dependency "jbuilder",      ">= 2.7"
  spec.add_dependency "method_source"
  spec.add_dependency "ostruct"
  spec.add_dependency "bigdecimal"
end
