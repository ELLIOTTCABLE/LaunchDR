# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{launchdr}
  s.version = "2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["elliottcable"]
  s.date = %q{2009-02-11}
  s.description = %q{One stop shop for launchd property list creation. The doctor is *in*!}
  s.email = ["launchdr@elliottcable.com"]
  s.extra_rdoc_files = ["lib/launchdr/launchd.rb", "lib/launchdr/property_list.rb", "lib/launchdr/task.rb", "lib/launchdr.rb", "README.markdown"]
  s.files = ["lib/launchdr/launchd.rb", "lib/launchdr/property_list.rb", "lib/launchdr/task.rb", "lib/launchdr.rb", "Rakefile.rb", "README.markdown", ".manifest", "launchdr.gemspec"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/elliottcable/launchdr}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Launchdr", "--main", "README.markdown"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{launchdr}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{One stop shop for launchd property list creation. The doctor is *in*!}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<kballard-osx-plist>, [">= 0"])
      s.add_runtime_dependency(%q<facets>, [">= 0"])
      s.add_runtime_dependency(%q<uuid>, [">= 0"])
      s.add_development_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
    else
      s.add_dependency(%q<kballard-osx-plist>, [">= 0"])
      s.add_dependency(%q<facets>, [">= 0"])
      s.add_dependency(%q<uuid>, [">= 0"])
      s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
    end
  else
    s.add_dependency(%q<kballard-osx-plist>, [">= 0"])
    s.add_dependency(%q<facets>, [">= 0"])
    s.add_dependency(%q<uuid>, [">= 0"])
    s.add_dependency(%q<echoe>, [">= 0", "= 3.0.2"])
  end
end
