($:.unshift File.expand_path(File.join( File.dirname(__FILE__), 'lib' ))).uniq!
begin 
  require 'launchdr'
rescue LoadError
  module LaunchDr; Version = -1; end
end

# =======================
# = Gem packaging tasks =
# =======================
begin
  require 'echoe'
  
  task :package => :'package:package'
  task :install => :'package:install'
  task :manifest => :'package:manifest'
  task :clobber => :'package:clobber'
  namespace :package do
    Echoe.new('launchdr', LaunchDr::Version) do |g|
      g.author = ['elliottcable']
      g.email = ['launchdr@elliottcable.com']
      g.summary = "One stop shop for launchd property list creation. The doctor is *in*!"
      g.url = 'http://github.com/elliottcable/launchdr'
      g.dependencies = ['kballard-osx-plist', 'facets']
      g.development_dependencies = ['elliottcable-echoe >= 3.0.2']
      g.manifest_name = '.manifest' # I don't want this showing up <,<
      g.retain_gemspec = true # perfect for GitHub
      g.rakefile_name = 'Rakefile.rb' # It's a Ruby file, why not have .rb?
      g.ignore_pattern = /^\.git\/|\.gemspec/
    end
  
    desc 'tests packaged files to ensure they are all present'
    task :verify => :package do
      # An error message will be displayed if files are missing
      if system %(ruby -e "require 'rubygems'; require 'pkg/launchdr-#{LaunchDr::Version}/lib/launchdr'")
        puts "\nThe library files are present"
      end
    end
  end
  
rescue LoadError
  desc 'You need the `elliottcable-echoe` gem to package LaunchDr'
  task :package
end
