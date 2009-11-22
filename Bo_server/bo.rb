require 'rubygems'
require 'sinatra'
require 'haml'
require "#{File.dirname(__FILE__)}/doc"

set :show_exceptions, false
set :logging, true
set :raise_errors, true
set :dump_errors, false
set :clean_trace, true


configure do
  set :pass => 'wadus'
  set :docs_path => "#{File.dirname(__FILE__)}/docs"
end

post '/' do
  Bo::Doc.process( params[:file][:filename], params[:file][:tempfile] )
end

get '/' do
  @docs = Bo::Doc.all
  
  haml :index
end

get '/:file_name' do
  @doc = Bo::Doc.find( params[:file_name] )
  
  haml :show
end
