class Temperature
  # TODO: your code goes here!
  def initialize(opt = {})
  	opt.each_key do |key|
      @key = key
  		@value = opt.fetch(key)
  	end
  end

  def in_fahrenheit
  	if @key == :c
     return  (9.0/5.0) * @value + 32 
    elsif @key == :f
      return @value
    end       
  end

  def in_celsius
    if @key == :f
  	 return  (5.0/9.0) * (@value - 32) 
    elsif @key == :c
      return @value
    end       
  end

  def self.from_celsius(num)
    self.new({:c => num})
  end

  def self.from_fahrenheit(num)
    self.new({:f => num})
  end
end

class Celsius < Temperature
  def initialize(num)
    @key = :c
    @value = num
  end
end

class Fahrenheit < Temperature
  def initialize(num)
    @key = :f
    @value = num
  end
end
