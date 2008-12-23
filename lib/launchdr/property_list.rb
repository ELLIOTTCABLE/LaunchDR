require 'osx/plist'
require 'uuid'

module LaunchDoctor
  
  class PropertyList
    attr_reader :elements
  
    def initialize id = nil, elements = {}
      @elements = elements
      @elements[:label] = id || "rb.launchdr.#{UUID.new.generate}"
    end
  
    def [] key
      @elements[key.to_s]
    end
  
    def []= key, value
      @elements[key] = value
    end
  
    def to_plist
      @elements.to_plist
    end
  
    def dump filename
      OSX::PropertyList.dump File.new(filename, 'w+'), @elements
    end
  
    def self.load filename
      elements = OSX::PropertyList.load File.new(File.expand_path filename, 'r')
      new elements[:label], elements
    end
  end
  
end
