class Dictionary
  # TODO: your code goes here!
  def initialize
  	@list = Hash.new
  end 

  def entries
  	@list 
  end

  def add(opt)
  	if opt.is_a?(Hash) 
  		opt.each_key do |key|
  			@list[key] = opt[key]
  		end
  	else
  		@list[opt] = nil
  	end
  			
  end

  def keywords
  	array = []
  	@list.each_key do |key|
  		array.push(key)
  	end

  	return array.sort
  end

  def include?(key)
  	if @list.has_key?(key) == false
  		return false
  	elsif @list[key] == nil
  		return true
  	else
  		return true
  	end
  end

  def find(looking_for)
  	list2 = Hash.new
  	@list.each do |key,value|
  		if /#{looking_for}/.match(key)
  			list2[key] = value
  		end
  	end
  	
  	if list2 == []
  		return false
  	else
  		return list2	
  		
  	end
  end

  def printable
  	print_string = ""
  	@list.sort.each do |key,value|
  		print_string = print_string + %Q{[#{key}] "#{value}"\n}
  	end
  	return print_string.chop
  end
end
