require 'facets/string'

module LaunchDr
  
  class Launchd < PropertyList
    Paths = {
      :user_agent => "~/Library/LaunchAgents",
      :agent => "/Library/LaunchAgents",
      :daemon => "/Library/LaunchDaemons", 
      :system_agent => "/System/Library/LaunchAgents",
      :system_daemon => "/System/Library/LaunchDaemons"
    }
    
    def [] key
      super(key.to_s.titlecase.camelcase)
    end
    
    def []= key, value
      super(key.to_s.titlecase.camelcase, value)
    end
    
    # Adds the property list to `launchctl`'s indexes, and starts it (unless
    # disabled).
    def load!
      system "launchctl load #{file}"
    end
    
    # Removes the propertly list from `launchctl`'s indexes.
    def unload!
      system "launchctl unload #{file}"
    end
    
    # Finds the plist file, if it's been created
    def file
      Paths.values.each do |dir|
        file = File.expand_path(File.join(dir, self[:label] + '.plist'))
        return file if File.file? file
      end
      raise "#{self[:label]} doesn't exist in any of the default locations. Did you #dump it?"
    end
  end
  
end
