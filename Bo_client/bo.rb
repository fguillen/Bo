require 'rubygems'
require 'httpclient'

class Bo
  def self.upload( url, pass, file_path )
    response = HTTPClient.post( url, { :file => File.new( file_path ) } )
    puts response.content
  end
end

Bo.upload( 'http://localhost:4567', '', '/tmp/wadus_2_que_pasa.txt' )