# load_utils will load (or reload) in our utils all at once
%w{ lib }.each do |dir| 
  globbee =  File.expand_path File.dirname(__FILE__) + "*.rb"
  Dir.glob( globbee ).each{ |f| load f }
end