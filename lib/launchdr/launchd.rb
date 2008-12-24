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
    
    # Nothing here as of yet. Maybe some convenience methods to come.
    
    def [] key
      super(key.to_s.camelcase)
    end
    
    def []= key, value
      super(key.to_s.camelcase, value)
    end
  end
  
end
