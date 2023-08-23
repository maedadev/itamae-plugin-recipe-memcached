# frozen_string_literal: true

require_relative "lib/itamae/plugin/recipe/memcached/version"

Gem::Specification.new do |spec|
  spec.name = "itamae-plugin-recipe-memcached"
  spec.version = Itamae::Plugin::Recipe::Memcached::VERSION
  spec.authors = ["y-matsuda"]
  spec.email = ["y.matsuda@bizside.biz"]

  spec.summary = %q{itamae recipe for memcached installation}
  spec.description = %q{itamae recipe for memcached installation}
  spec.homepage = "https://github.com/maedadev/itamae-plugin-recipe-memcached"
  spec.required_ruby_version = ">= 2.5.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'itamae', '~> 1.10', '>= 1.10.4'
end
