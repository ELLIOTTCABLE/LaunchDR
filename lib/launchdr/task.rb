require 'launchdr'

module LaunchDr
  
  module Task
    def self.new name = :launchd, opts = {}
      raise "`LaunchDr.task`'s options must include the name of the binary for your gem!" unless opts[:bin]
      opts = {:desc => 'Creates a launchd property list for this gem', :arguments => []}.merge opts

      desc opts[:desc] unless opts[:no_desc]
      task name do
        LaunchDr "rb.launchdr.#{opts[:bin]}" do |plist|
          plist[:program_arguments] = [File.join('/usr/local/bin', opts[:bin]), opts[:arguments]].flatten
          plist[:keep_alive] = true
          plist[:run_at_load] = true
        end
      end

    end
  end
  
end