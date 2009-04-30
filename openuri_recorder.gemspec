# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{openuri_recorder}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ben Schwarz"]
  s.date = %q{2009-04-30}
  s.email = %q{ben.schwarz@gmail.com}
  s.extra_rdoc_files = ["README.mdown", "LICENSE"]
  s.files = ["README.mdown", "VERSION.yml", "lib/openuri_recorder.rb", "spec/openuri_recorder_spec.rb", "spec/spec_helper.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/benschwarz/openuri_recorder}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{TODO}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
