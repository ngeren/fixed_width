module FixedWidth

  class Column
    attr_accessor :id
    attr_accessor :length

    def initialize( id, length )
      @id = id
      @length = length
    end    

    def format( value )
      return value      
    end    
  end

end