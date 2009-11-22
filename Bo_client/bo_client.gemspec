# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bo_client}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fernando Guillen"]
  s.date = %q{2009-11-22}
  s.default_executable = %q{bo}
  s.description = %q{Console client for Bo}
  s.email = %q{fguillen.mail@gmail.com}
  s.executables = ["bo"]
  s.extra_rdoc_files = ["README.rdoc", "bin/bo", "lib/bo.rb"]
  s.files = ["README.rdoc", "Rakefile", "bin/bo", "lib/bo.rb", "Manifest", "bo_client.gemspec"]
  s.homepage = %q{http://bo.fernandoguillen.info}
  s.post_install_message = %q{Bo installed!}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Bo_client", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{bo_client}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Console client for Bo}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
