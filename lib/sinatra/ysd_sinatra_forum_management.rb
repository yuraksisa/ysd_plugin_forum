require 'ysd_md_integration'
module Sinatra
  module YSD
    module ForumManagement
   
      def self.registered(app)
                    
        #
        # Forums management page
        #
        app.get "/forum-management" do
          load_page :forum_management
        end
        
        #
        # Forums (list all the forums and allow the user access to a concrete forum)
        #
        app.get "/forum" do
          load_page :forums
        end
        
        #
        # Forum conversations: Show all the forum conversations
        #
        app.get "/forum/:forum_address/?*" do
          forum = MailDataSystem::MailBox.get(params[:forum_address])
          pass if forum.nil?
          load_page(:forum_conversations, :locals => {:forum => forum})
        end
        
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra