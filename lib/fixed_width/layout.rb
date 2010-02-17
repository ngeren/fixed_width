module FixedWidth

  class Layout
    attr_reader :columns    

    def initialize( columns = nil )
      @columns = Array.new()
      if !columns.nil? && columns.kind_of?(Array) then
        columns.each do |col|
          if !col.kind_of?(FixedWidth::Column) then
            raise "Invalid column specified. Must be of type FixedWidth::Column."
          end
        end
        @columns = columns      
      end
    end  
    
    def <<( column )
      if column.kind_of?(FixedWidth::Column) then
        @columns << column
      else
        raise "Invalid column specified. Must be of type FixedWidth::Column."
      end
    end  
  end

end