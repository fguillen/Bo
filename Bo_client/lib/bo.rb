require 'rubygems'
require 'httpclient'

class Bo
  def self.upload( url, pass, file_path )
    response = HTTPClient.post( url, { :file => File.new( file_path ) } )
    puts response.content
  end
end