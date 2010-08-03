require 'plist'
require 'uuid'

module LaunchDr
  
  class PropertyList
    attr_reader :elements
  
    def initialize label = nil, elements = {}
      @elements = elements
      @elements['Label'] = label || "rb.launchdr.#{UUID.new.generate}"
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
  
    def dump path
      out = File.new(File.expand_path(File.join(path, @elements['Label'] + '.plist')), 'w+')
      out.puts Plist::Emit.dump @elements
      out.close
    end
  
    def self.load filename
      elements = Plist::parse_xml File.new(File.expand_path filename, 'r')
      new elements[:label], elements
    end
  end
  
end
