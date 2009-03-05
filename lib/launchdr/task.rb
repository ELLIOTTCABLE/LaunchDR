require 'launchdr'

module LaunchDr
  
  module Task
    def self.new name = :launchd, opts = {}
      raise "`LaunchDr.task`'s options must include the name of the binary for your gem!" unless opts[:bin]
      opts = {:desc => 'Creates a launchd property list for this gem', :arguments => []}.merge opts

      desc opts[:desc] unless opts[:no_desc]
      task name do
        path = File.expand_path File.join('', opts[:bin])
        unless File.file? path
          path = File.expand_path File.join(Gem::default_bindir, opts[:bin])
          unless File.file? path
            path = File.expand_path %x[which "#{opts[:bin]}"].chomp
          end
        end
        unless File.file? path
          raise "** Unable to locate binary #{opts[:bin]}"
        end
        LaunchDr "rb.launchdr.#{opts[:bin]}" do |plist|
          plist[:program_arguments] = [path, opts[:arguments]].flatten
          plist[:keep_alive] = true
          plist[:run_at_load] = true
        end
        puts "** `#{[path, opts[:arguments]].flatten.join(' ')}` will now be run on startup!"
      end

    end
  end
  
end
