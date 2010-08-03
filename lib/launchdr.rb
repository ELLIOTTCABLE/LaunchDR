require 'launchdr/property_list'
require 'launchdr/launchd'


def LaunchDr label, opts = {}
  LaunchDr.create label, opts, &Proc.new
end
module LaunchDr
  Version = 3
  Options = Hash.new
  
  def self.create label, opts = {}
    plist = Launchd.new label
    
    yield plist if block_given?
    
    raise "You must run as a root user and allow_system_agents! if you wish to preform the dangerous act of writing to #{Launchd::Paths[:system_agent]}!" unless !(opts[:type] == :system_agent) or Options[:system_agents_allowed]
    raise "You must run as a root user, allow_system_agents!, *and* allow_system_daemons! if you wish to preform the very dangerous act of writing to #{Launchd::Paths[:system_daemon]}!" unless !(opts[:type] == :system_daemon) or Options[:system_daemon_allowed]
    path = Launchd::Paths[opts[:type] || :user_agent]
    raise "Type error! Must be one of #{Launchd::Paths.keys.join(", ")}" unless path
    
    plist.dump File.expand_path(path)
    plist.load!
  end
  
  def self.allow_system_agents!
    Options[:system_agents_allowed] = true
  end
  
  def self.allow_system_daemons!
    raise "You must allow System-owned agents to allow System-owned daemons!" unless Options[:system_agents_allowed]
    Options[:system_daemon_allowed] = true
  end
  
  
end
