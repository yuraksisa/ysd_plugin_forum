require 'ysd-plugins' unless defined?Plugins::Plugin
require 'sinatra/ysd_plugin_forum_middleware'
require 'ysd_plugin_forum_extension'

Plugins::SinatraAppPlugin.register :forum do

   name=        'forum'
   author=      'yurak sisa'
   description= 'Integrate the forum application'
   version=     '0.1'
   sinatra_extension Sinatra::Forum
   sinatra_extension Sinatra::YSD::ForumManagement
   sinatra_extension Sinatra::YSD::ForumRESTApi
   sinatra_extension Sinatra::YSD::ForumThreadRESTApi
   hooker            Huasi::ForumExtension
  
end