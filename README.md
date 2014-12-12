# Yito forum plugin

It's a yito plugin that implements the GUI to manage forum:

* Define forums
* Forum browsing and threads publishing

## Usage

Just include the gem dependency in your Gemfile and run bundle update

```ruby
gem "ysd_plugin_forum"
```

A new menu option, /admin/forums, will be accesible in the content manager 
menu.

A new route, /forum ,will be accesible. It shows the forum that have been 
defined. You can use it in the primary menu links.