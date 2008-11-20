class Logger
  @@enabled = true # great time savings are to be had by setting this to false
  def method_missing( name, *args )
    log(name, args) if @@enabled
  end
  
  def silence &block
    old_enabled=  @@enabled
    @@enabled = false
    yield
  ensure
    @@enabled = old_enabled
  end
  
private
  def log( name, *args)
    puts "#{name}: " + args.join
  end
end

#make an instance of Logger available to all objects anywhere
class Object
  def logger
    @@logger ||= Logger.new
  end
end