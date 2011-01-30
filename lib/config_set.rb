class ConfigSet

  VERSION = '0.1.2'

  Index = Hash.new

  def initialize(name)
    @name = name
  end
  
  def yielding(&block)
    @yielding = true
    yield
    @yielding = false
  end

  def self.for(name, &block)
    config = Index[name] ||= ConfigSet.new(name)
    block && config.yielding { config.instance_eval &block }
    config
  end

  def method_missing(name, *args, &block)
    case
    when name.to_s =~ /\=/
      instance_variable_set("@#{name.to_s.gsub(/\=/, '')}", args[0])
    when @yielding
      value = block ? ConfigSet.for(name, &block) : args[0]
      instance_variable_set "@#{name}", value
    when !args[0]
      instance_variable_get "@#{name}"      
    end
  end

end
