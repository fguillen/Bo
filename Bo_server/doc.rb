module Bo
  class Doc
    attr_accessor :title, :body, :date, :file_name
    
    DEFAULT_DOCS_PATH = "#{File.dirname(__FILE__)}/docs"
  
    def self.process( name, data )
      FileUtils.mkpath( DEFAULT_DOCS_PATH )
      
      data_readed = data.read.strip
      
      if data_readed.size == 0
        if File.exists?( "#{DEFAULT_DOCS_PATH}/#{name}" )
          File.delete( "#{DEFAULT_DOCS_PATH}/#{name}" )  
          sufix = "deleted"
        else
          sufix = "not found"
        end
      else
        sufix = File.exists?( "#{DEFAULT_DOCS_PATH}/#{name}" ) ? 'updated' : 'created'
        File.open( "#{DEFAULT_DOCS_PATH}/#{name}", "w" ) { |f| f.write( data_readed ) }
      end
      
      return "#{Bo::Doc.to_title( name )} #{sufix}!"
    end
  
    def self.find( file_name )
      return nil  unless File.exists?( "#{DEFAULT_DOCS_PATH}/#{file_name}" )
      
      file = File.new( "#{DEFAULT_DOCS_PATH}/#{file_name}" )
    
      doc = Bo::Doc.new
    
      doc.title =       Bo::Doc.to_title( File.basename( file.path ) )
      doc.body =        file.read   
      doc.file_name =   File.basename( file.path )
      
      return doc
    end
  
    def self.all
      # puts "XXX: #{DEFAULT_DOCS_PATH}: #{DEFAULT_DOCS_PATH}"
      @docs = []
      Dir.glob( "#{DEFAULT_DOCS_PATH}/*" ).each do |file_name|
        @docs << Doc.find( File.basename( file_name ) )
      end
      
      return @docs
    end
    
    def self.to_title( file_name )
      file_name.gsub( /\.[^.]*$/, '' ).split(/[-_.]/).map{ |e| e.capitalize }.join( " " )
    end
        
  end
end