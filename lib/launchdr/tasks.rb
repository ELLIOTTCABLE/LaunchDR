module LaunchDoctor
  
  def task name = :launchd, opts = {}
    raise "`LaunchDoctor.task`'s options must include the name of the binary for your gem!" unless opts[:bin]
    opts = {:desc => 'Creates a launchd property list for this gem', :arguments => []}.merge opts
    
    desc opts[:desc] unless opts[:no_desc]
    task name do
      LaunchDoctor label do |plist|
        plist[:program_arguments] = [File.join('/usr/local/bin', opts[:bin]), opts[:arguments]].flatten
        plist[:keep_alive] = true
        plist[:run_at_load] = true
      end
    end
    
  end
  
end