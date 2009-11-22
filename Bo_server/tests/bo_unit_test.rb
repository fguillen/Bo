require 'test/unit'
require 'fileutils'
require 'rubygems'
require 'mocha'
require 'tmpdir'
require 'test_helper'
require "#{File.dirname(__FILE__)}/../doc"

class BoUnitTest < Test::Unit::TestCase
  include TestHelper
  
  def test_to_title
    assert_equal( "Wadus Wadus Wadus", Bo::Doc.to_title( "wadus_wadus_wadus" ) )
    assert_equal( "Wadus Wadus Wadus", Bo::Doc.to_title( "wadus_wadus_wadus.txt" ) )
    assert_equal( "Wadus Wadus Wadus Echo", Bo::Doc.to_title( "wadus_wadus_wadus.echo.txt" ) )
    assert_equal( "Wadus Wadus Wadus", Bo::Doc.to_title( "wadus-wadus-wadus" ) )
  end
  
  def test_all
    n = 0
    4.times{ create_doc_file( "file_#{n += 1}.txt" ) }
    assert_equal( [ "File 1", "File 2", "File 3", "File 4" ], Bo::Doc.all.map { |e| e.title } )
  end
  
  def test_process_with_new_file_should_create_file
    file_name = 'wadus.txt'
    file = create_file( file_name, 'xxx' )
    assert_equal( 'Wadus created!', Bo::Doc.process( file_name, file ) )
    assert( File.exists?( "#{Bo::Doc::DEFAULT_DOCS_PATH}/#{file_name}" ) )
    assert_equal( 'xxx', File.read( "#{Bo::Doc::DEFAULT_DOCS_PATH}/#{file_name}" ) )
  end

  def test_process_with_existing_file_should_update_file
    file_name = 'wadus.txt'
    file = create_file( file_name, 'xxx' )
    doc_file = create_doc_file( file_name, 'yyy' )
    assert_equal( 'Wadus updated!', Bo::Doc.process( file_name, file ) )
    assert_equal( 'xxx', File.read( "#{Bo::Doc::DEFAULT_DOCS_PATH}/#{file_name}" ) )
  end
  
  def test_process_with_empty_file_should_delete_file
    file_name = 'wadus.txt'
    file = create_file( file_name, "  \n  \n\n" )  # empty lines should be empty too
    doc_file = create_doc_file( file_name )
    assert_equal( 'Wadus deleted!', Bo::Doc.process( file_name, file ) )
    assert( !File.exists?( "#{Bo::Doc::DEFAULT_DOCS_PATH}/#{file_name}" ) )
  end
end