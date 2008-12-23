require 'facets/string'

module LaunchDoctor
  
  class Launchd < PropertyList
    # Nothing here as of yet. Maybe some convenience methods to come.
    
    def [] key
      super(key.to_s.camelcase)
    end
  end
  
end
