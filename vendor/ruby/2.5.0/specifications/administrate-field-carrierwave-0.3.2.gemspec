# -*- encoding: utf-8 -*-
# stub: administrate-field-carrierwave 0.3.2 ruby lib

Gem::Specification.new do |s|
  s.name = "administrate-field-carrierwave".freeze
  s.version = "0.3.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Michele Gerarduzzi".freeze]
  s.date = "2018-03-06"
  s.description = "A plugin to manage Carrierwave attachments in Administrate".freeze
  s.email = ["michele.gerarduzzi@gmail.com".freeze]
  s.homepage = "https://github.com/zooppa/administrate-field-carrierwave".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.3".freeze
  s.summary = "Carrierwave field plugin for Administrate".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<administrate>.freeze, ["< 1.0.0"])
      s.add_runtime_dependency(%q<rails>.freeze, ["< 6", ">= 4.2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.7"])
    else
      s.add_dependency(%q<administrate>.freeze, ["< 1.0.0"])
      s.add_dependency(%q<rails>.freeze, ["< 6", ">= 4.2"])
      s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<administrate>.freeze, ["< 1.0.0"])
    s.add_dependency(%q<rails>.freeze, ["< 6", ">= 4.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.7"])
  end
end
