# load_models will load (or reload) in our models all at once
%w{ app/models app/models/pieces }.each do |dir| 
  globbee =  File.expand_path File.dirname(__FILE__) + "/../#{dir}/*.rb"
  Dir.glob( globbee ).each{ |f| load f }
end