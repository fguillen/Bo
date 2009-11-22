module TestHelper
  def setup
    @old_default_docs_path = Bo::Doc.const_get( "DEFAULT_DOCS_PATH" )
    @temp_docs_path = File.join( Dir.tmpdir, Time.now.strftime("%s%N") )
    Bo::Doc.const_set( "DEFAULT_DOCS_PATH", @temp_docs_path )
  end
  
  def teardown
    FileUtils.rm_rf @temp_docs_path
    Bo::Doc.const_set( "DEFAULT_DOCS_PATH", @old_default_docs_path )
  end
  
  def create_doc_file( name = 'wadus.txt', content = 'wadus content' )
    FileUtils.mkpath( "#{Bo::Doc::DEFAULT_DOCS_PATH}" )
    File.open( "#{Bo::Doc::DEFAULT_DOCS_PATH}/#{name}", 'w' ) { |f| f.write( content ) }
    File.new( "#{Bo::Doc::DEFAULT_DOCS_PATH}/#{name}" )
  end

  def create_file( name = 'wadus.txt', content = 'wadus content' )
    File.open( "#{Dir.tmpdir}/#{name}", 'w' ) { |f| f.write( content ) }
    File.new( "#{Dir.tmpdir}/#{name}" )
  end
  
end