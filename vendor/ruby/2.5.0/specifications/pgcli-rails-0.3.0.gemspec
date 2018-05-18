# -*- encoding: utf-8 -*-
# stub: pgcli-rails 0.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "pgcli-rails".freeze
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Brictson".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-02-24"
  s.email = ["opensource@mattbrictson.com".freeze]
  s.homepage = "https://github.com/mattbrictson/pgcli-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.3".freeze
  s.summary = "Replaces the Rails PostgreSQL dbconsole with the much nicer pgcli".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>.freeze, [">= 4.2.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_development_dependency(%q<chandler>.freeze, [">= 0"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<minitest-reporters>.freeze, ["~> 1.1"])
      s.add_development_dependency(%q<rubocop>.freeze, ["= 0.48.1"])
    else
      s.add_dependency(%q<railties>.freeze, [">= 4.2.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
      s.add_dependency(%q<chandler>.freeze, [">= 0"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1.1"])
      s.add_dependency(%q<rubocop>.freeze, ["= 0.48.1"])
    end
  else
    s.add_dependency(%q<railties>.freeze, [">= 4.2.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.12"])
    s.add_dependency(%q<chandler>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<minitest-reporters>.freeze, ["~> 1.1"])
    s.add_dependency(%q<rubocop>.freeze, ["= 0.48.1"])
  end
end
