require 'ysd_md_integration'
module Sinatra
  module YSD
    module ForumManagement
   
      def self.registered(app)
            
        # Add the local folders to the views and translations     
        app.settings.views = Array(app.settings.views).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'i18n')))
        
        #
        # Forums management page
        #
        app.get "/forum-management" do
          load_page 'forum_management'.to_sym
        end
        
        #
        # Forums (list all the forums and allow the user access to a concrete forum)
        #
        app.get "/forum" do
          load_page 'forums'.to_sym
        end
        
        #
        # Forum conversations: Show all the forum conversations
        #
        app.get "/forum/:forum_address/?*" do
          forum = MailDataSystem::MailBox.get(params[:forum_address])
          pass if forum.nil?
          load_page 'forum_conversations'.to_sym, :locals => {:forum => forum}
        end
        
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra