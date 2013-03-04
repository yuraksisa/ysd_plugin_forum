require 'json' unless defined?JSON
require 'ysd_md_mail' unless defined?MailDataSystem

module Sinatra
  module YSD
    #
    # Sinatra extension: Forum REST API
    #
    module ForumRESTApi
   
      def self.registered(app)
                            
        #
        # Retrive all forums (GET)
        #
        app.get "/forums" do
        
          data=MailDataSystem::MailBox.find_mailboxes_by_type(:forum)
  
          content_type :json
          data.to_json
        end
        
        #
        # Retrieve forums (POST)
        #
        ["/forums","/forums/page/:page"].each do |path|
          app.post path do
          
            data  = MailDataSystem::MailBox.find_mailboxes_by_type(:forum)
            total = MailDataSystem::MailBox.count_mailboxes_by_type(:forum)
            
            content_type :json
            {:data => data, :summary => {:total => total}}.to_json
          
          end
        
        end
        
        #
        # Create a new forum
        #
        app.post "/forum" do
                  
          request.body.rewind
          forum_request = JSON.parse(URI.unescape(request.body.read))
          
          the_forum = MailDataSystem::MailBox.create(forum_request) 
          
          status 200
          content_type :json
          the_forum.to_json          
        
        end
        
        #
        # Updates a forum
        #
        app.put "/forum" do
                
          request.body.rewind
          forum_request = JSON.parse(URI.unescape(request.body.read))
          
          the_forum = MailDataSystem::MailBox.get(forum_request['address'])
          the_forum.attributes=(forum_request)
          the_forum.save
                   
          status 200
          content_type :json
          the_forum.to_json
      
        end
        
        #
        # Deletes a external service account
        #
        app.delete "/forum" do
        
        end
      
      end
    
    end #ForumManagement
  end #YSD
end #Sinatra