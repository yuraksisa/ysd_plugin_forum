require 'ysd_md_integration'
module Sinatra
  module YSD
    module Forum
   
      def self.registered(app)
            
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))
                
      end
    
    end #Forum
  end #YSD
end #Sinatra