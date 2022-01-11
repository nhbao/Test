# -*- encoding: utf-8 -*-
# stub: twilio-test-toolkit 3.4.0 ruby lib

Gem::Specification.new do |s|
  s.name = "twilio-test-toolkit".freeze
  s.version = "3.4.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jack Nichols".freeze]
  s.date = "2014-01-14"
  s.description = "Better integration tests for apps that use Twilio".freeze
  s.email = ["jack@jmongol.com".freeze]
  s.homepage = "https://github.com/jmongol/twilio-test-toolkit".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Better integration tests for apps that use Twilio".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<uuidtools>.freeze, [">= 0"])
    s.add_development_dependency(%q<rails>.freeze, ["~> 3.2.12"])
    s.add_development_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_development_dependency(%q<sqlite3-ruby>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_development_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_development_dependency(%q<jquery-rails>.freeze, [">= 0"])
  else
    s.add_dependency(%q<capybara>.freeze, [">= 0"])
    s.add_dependency(%q<uuidtools>.freeze, [">= 0"])
    s.add_dependency(%q<rails>.freeze, ["~> 3.2.12"])
    s.add_dependency(%q<sqlite3>.freeze, [">= 0"])
    s.add_dependency(%q<sqlite3-ruby>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<rspec-rails>.freeze, [">= 0"])
    s.add_dependency(%q<jquery-rails>.freeze, [">= 0"])
  end
end
