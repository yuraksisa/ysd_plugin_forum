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
            
            # It redirects to the conversation retrieving
            status, header, body = call! env.merge({"PATH_INFO" => "/mail/messages/#{mailbox}/#{folder}/page/#{page}", "REQUEST_METHOD" => 'GET'})    
                    
          end
        
        end
        
        #
        # Create a new conversation
        #
        app.post "/forum/new-thread" do
              
          puts "Creating a new thread"

          # It redirects to the conversation post
          status, header, body = call! env.merge("PATH_INFO" => "/mail/message")                             
        
        end

        #
        # Reply a conversation
        #
        app.post "/forum/reply" do
        
          puts "Replying a conversation"
          
          # It redirects to the conversation post
          status, header, body = call! env.merge("PATH_INFO" => "/mail/message")        
        
        end
        
        #
        # Get a conversation
        #
        app.get "/forum/thread/:id" do
        
          puts "Retrieving conversation : /mail/messages/in/#{params[:id]}"
        
          status, header, body = call! env.merge("PATH_INFO" => "/mail/messages/in/#{params[:id]}")
        
        end
      
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra