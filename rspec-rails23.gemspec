# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec-rails23}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rob Sanheim"]
  s.date = %q{2010-11-27}
  s.description = %q{Rails 2.3.5 Extension for Rspec 2}
  s.email = %q{rsanheim@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README"
  ]
  s.files = [
    "CHANGELOG",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README",
    "RSPEC-LICENSE",
    "Rakefile",
    "VERSION",
    "lib/rspec-rails23.rb",
    "lib/rspec/rails23/configuration.rb",
    "lib/rspec/rails23/controllers.rb",
    "lib/rspec/rails23/extensions/active_record.rb",
    "lib/rspec/rails23/helpers.rb",
    "lib/rspec/rails23/matchers/controllers/redirect_to.rb",
    "lib/rspec/rails23/matchers/controllers/render_template.rb",
    "lib/rspec/rails23/mocking/model_stubber.rb",
    "lib/rspec/rails23/mocking/with_mocha.rb",
    "lib/rspec/rails23/mocking/with_rr.rb",
    "lib/rspec/rails23/transactional_database_support.rb",
    "spec/lib/rspec/rails23/configuration_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/rsanheim/rspec-rails23}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rspec Rails for 2.3.5}
  s.test_files = [
    "spec/lib/rspec/rails23/configuration_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rspec-rails23>, [">= 0"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 2.3.0"])
      s.add_runtime_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.9"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 2.3.0"])
      s.add_runtime_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.9"])
    else
      s.add_dependency(%q<rspec-rails23>, [">= 0"])
      s.add_dependency(%q<actionpack>, ["~> 2.3.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
      s.add_dependency(%q<mocha>, ["= 0.9.9"])
      s.add_dependency(%q<actionpack>, ["~> 2.3.0"])
      s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    end
  else
    s.add_dependency(%q<rspec-rails23>, [">= 0"])
    s.add_dependency(%q<actionpack>, ["~> 2.3.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.1"])
    s.add_dependency(%q<mocha>, ["= 0.9.9"])
    s.add_dependency(%q<actionpack>, ["~> 2.3.0"])
    s.add_dependency(%q<rspec>, ["~> 2.0.0"])
  end
end

