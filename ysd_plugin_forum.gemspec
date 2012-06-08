Gem::Specification.new do |s|
  s.name    = "ysd_plugin_forum"
  s.version = "0.1"
  s.authors = ["Yurak Sisa Dream"]
  s.date    = "2012-05-16"
  s.email   = ["yurak.sisa.dream@gmail.com"]
  s.files   = Dir['lib/**/*.rb','views/**/*.erb','i18n/**/*.yml','static/**/*.*'] 
  s.description = "Forum integration"
  s.summary = "Forum integration"
  
  s.add_runtime_dependency "ysd_core_plugins"
  s.add_runtime_dependency "ysd_md_mail"
  s.add_runtime_dependency "ysd_mw_forum"
  s.add_runtime_dependency "ysd_mw_mail"
  
end