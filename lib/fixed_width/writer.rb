module FixedWidth

  class Writer
    attr_accessor :io
    attr_accessor :line_terminator
    attr_reader :layout
    
    def initialize( io, layout )
      @layout = layout
      @io = io
      @line_terminator = "\n"
    end    

    def write( data )
      raise "Invalid data type. Expecting Hash." if !data.kind_of?( Hash )
      @layout.columns.each do |column|
        value = nil
        value = data[ column.id ] if data.has_key?( column.id )
        value = data[ column.id.to_s ] if data.has_key?( column.id.to_s )
        value = "" if value.nil?
        if value.size() > column.length then
          value = value[0, column.length] 
        elsif value.size() < column.length then
          for i in ( 1..( column.length - value.size() ) )
            value << " "
          end
        end        
        io.write( value )
      end
      io.write( @line_terminator )
    end
  end

end