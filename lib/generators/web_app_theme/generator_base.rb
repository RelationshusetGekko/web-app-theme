module WebAppTheme
  module GeneratorBase
    
    attr_accessor :m
    
    protected
    
    def create_directory(location)
      if @rails2
        @m.directory location
      else
        @m.empty_directory location
      end
    end
    
    def copy(from, to)
      if @rails2
        @m.file from, to
      else
        @m.copy_file from, to
      end
    end
    
    def rails2!(m)
      @rails2 = true
      @m = m
    end
    
    def rails3!
      @rails2 = false
      @m = self
    end
  end
end