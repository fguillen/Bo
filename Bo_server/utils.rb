module Bo
  class Utils
    def self.prepare_assets
      FileUtils.cp_r( "#{Sinatra::Application.views}/assets", "#{File.dirname(__FILE__)}/public/" )
    end
  end
end