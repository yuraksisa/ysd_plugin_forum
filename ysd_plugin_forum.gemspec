Gem::Specification.new do |s|
  s.name    = "ysd_plugin_forum"
  s.version = "0.1.8"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-05-16"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "Forum integration"
  s.summary = "Forum integration"
  
  s.add_runtime_dependency "json"
  
  s.add_runtime_dependency "ysd_md_mail"      # Model 
  s.add_runtime_dependency "ysd_plugin_mail"  # Model messages through REST API

  s.add_runtime_dependency "ysd_yito_core"    # Page loading
  s.add_runtime_dependency "ysd_yito_js"      # Yito JS library

  s.add_runtime_dependency "ysd_core_plugins" # Plugins system

end