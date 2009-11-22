require "#{File.dirname(__FILE__)}/../bo"
require 'test/unit'
require 'rack/test'
require 'test_helper'
require 'mocha'


class BoFunctionalTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include TestHelper

  def app
    Sinatra::Application
  end


  def test_post
    file = create_file
    
    post '/', :file => Rack::Test::UploadedFile.new( file.path )
    
    assert last_response.ok?
    assert_match( "created!", last_response.body )
    assert( File.exists?( "#{Bo::Doc::DEFAULT_DOCS_PATH}/#{File.basename( file.path )}" ) )
  end
  
  def test_get
    file_names = [1,2,3,4].map { |e| "file_#{e}.txt" }
    file_names.each { |e| create_doc_file( e ) }
    
    get '/'
    
    assert last_response.ok?    
    file_names.each do |file_name|
      assert_match( Bo::Doc.to_title( file_name ), last_response.body, "not found #{file_name} on response" )
    end
  end

  def test_show
    doc_file = create_doc_file( 'wadus.txt', 'xxx' )
    
    get "/wadus.txt"
    
    assert last_response.ok?
    assert_match( 'Wadus', last_response.body )
    assert_match( 'xxx', last_response.body )
  end
  
  def test_on_startup_should_copy_assets_to_public
    # TODO: HOW IN THE HELL CAN I TEST THIS?
    # TODO: better one only optimized css?
    File.delete( "#{File.dirname(__FILE__)}/../public/bo.css" )
    assert( !File.exists?( "#{File.dirname(__FILE__)}/../public/bo.css" ) )
        
    # app.configure # doesn't exists
    
    assert( File.exists?( "#{File.dirname(__FILE__)}/../public/bo.css" ) )
  end
end
