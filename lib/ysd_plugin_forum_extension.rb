require 'ysd-plugins_viewlistener' unless defined?Plugins::ViewListener

#
# Forum Extension
#
module Huasi

  class ForumExtension < Plugins::ViewListener
                        
    # ========= Menu =====================

    #
    # It defines the admin menu menu items
    #
    # @return [Array]
    #  Menu definition
    #    
    def menu(context={})
       
      app = context[:app]
      
      menu_items = [{:path => '/cms/forums',
                     :options => {:title => app.t.forum_admin_menu.forum_management,
                                  :link_route => "/forum-management",
                                  :description => 'The forum admin tools to create and modify the forums.',
                                  :module => :forum,
                                  :weight => 3}}]      
   
    end

 
    # ========= Routes ===================
    
    # routes
    #
    # Define the module routes, that is the url that allow to access the funcionality defined in the module
    #
    #
    def routes(context={})
    
      routes = [{:path => '/forum-management',
                 :regular_expression => /^\/forum-management/,
                 :title => 'Forums',
                 :description => 'The forum admin tools to create and modify the forums',
                 :fit => 1,
                 :module => :forum},
                {:path => '/forum',
                 :regular_expression => /^\/forum/,
                 :title => 'Forums',
                 :description => 'It shows the forum list and access to the forum discussions',
                 :fit => 1,
                 :module => :forum},
                {:path => '/forum/:forum_address',
                 :parent_path => '/forum',
                 :regular_expression => /^\/forum\/.+/,
                 :title => 'Discussions',
                 :description => 'It shows the forum messages and permit the user to take part in the discussions.',
                 :fit => 2,
                 :module => :forum}]
    
    end
  
  end #MailExtension
end #Social