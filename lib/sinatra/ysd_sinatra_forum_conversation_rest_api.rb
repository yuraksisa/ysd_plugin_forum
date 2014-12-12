require 'uri'
module Sinatra
  module YSD
    module ForumThreadRESTApi
   
      def self.registered(app)
                                    
        #
        # Retrieve forums (POST)
        #
        ["/api/forum/messages/:forum_address","/api/forum/messages/:forum_address/page/:page"].each do |path|
          app.post path do

            mailbox = params[:forum_address]
            folder = 'in'
            page = params[:page] || 1
            
            status, header, body = call! env.merge({"PATH_INFO" => "/api/mail/messages/#{mailbox}/#{folder}/page/#{page}", "REQUEST_METHOD" => 'GET'})    
                    
          end
        
        end
        
        #
        # Create a new conversation
        #
        app.post "/api/forum/new-thread" do
              
          status, header, body = call! env.merge("PATH_INFO" => "/api/mail/message")                             
        
        end

        #
        # Reply a conversation
        #
        app.post "/api/forum/reply" do
        
          status, header, body = call! env.merge("PATH_INFO" => "/api/mail/message")        
        
        end
        
        #
        # Get a conversation
        #
        app.get "/api/forum/thread/:id" do
        
          status, header, body = call! env.merge("PATH_INFO" => "/api/mail/messages/in/#{params[:id]}")
        
        end
      
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra