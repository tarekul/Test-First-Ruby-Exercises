class XmlDocument
  # TODO: your code goes here!
  def initialize(to_indent = false)
  	@to_indent = to_indent
  	@indent = 0
  end
  
  def hello(input = nil)
  	hold = ""
  	if input
  		input.each_value do |y|
  			hold = 	%Q(<hello name="#{y}"/>)
  		end
	else
  		hold = "<hello/>"
  		if block_given?
  			if @to_indent
  				hold = "<hello>\n" + yield + "</hello>\n"
  			else
  				hold = "<hello>" + yield + "</hello>"	
  			end
  		end
  	end
  	return hold 
  end

  def send(tag_name = nil)
  	return "<#{tag_name}/>"
  end

  def goodbye
  	hold =  "<goodbye/>"
  	space = " "
  	@indent += 2
  	space *= @indent
  	if block_given?
  		if @to_indent
  			hold = space + "<goodbye>\n" + yield + space + "</goodbye>\n"
  		else
  			hold = "<goodbye>" + yield + "</goodbye>"
  		end
  	end
  	return hold
  end

  def come_back
  	if @to_indent
  		space = " "
  		@indent += 2
  		space = space * @indent 
  		hold = space + "<come_back>\n" + yield + space + "</come_back>\n"
  	else
  		hold = "<come_back>" + yield + "</come_back>"
  	end
  end

  def ok_fine(input)
  	key = ""
  	value = ""
  	input.each do |k,v|
  		key = k
  		value = v 
  	end

  	if @to_indent
  		space = " "
  		@indent += 2
  		space *= @indent
  		return %Q(#{space}<ok_fine #{key.to_s}="#{value}"/>\n)
  	else
  		return %Q(<ok_fine #{key.to_s}="#{value}"/>)
  	end
  end
end
