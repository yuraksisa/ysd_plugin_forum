require 'uri'
module Sinatra
  module YSD
    module ForumThreadRESTApi
   
      def self.registered(app)
                                    
        #
        # Retrieve forums (POST)
        #
        ["/forum/messages/:forum_address","/forum/messages/:forum_address/page/:page"].each do |path|
          app.post path do

            mailbox = params[:forum_address]
            folder = 'in'
            page = params[:page] || 1
            
            status, header, body = call! env.merge({"PATH_INFO" => "/mail/messages/#{mailbox}/#{folder}/page/#{page}", "REQUEST_METHOD" => 'GET'})    
                    
          end
        
        end
        
        #
        # Create a new conversation
        #
        app.post "/forum/new-thread" do
              
          status, header, body = call! env.merge("PATH_INFO" => "/mail/message")                             
        
        end

        #
        # Reply a conversation
        #
        app.post "/forum/reply" do
        
          status, header, body = call! env.merge("PATH_INFO" => "/mail/message")        
        
        end
        
        #
        # Get a conversation
        #
        app.get "/forum/thread/:id" do
        
          status, header, body = call! env.merge("PATH_INFO" => "/mail/messages/in/#{params[:id]}")
        
        end
      
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra