class XmlDocument
  # TODO: your code goes here!
  def initialize(indent = false)
  	@indent = indent
  	@indent_level = 0
  end

  def method_missing(method_symbol, *args)
  	xml = ""
  	xml += "<" + method_symbol.to_s
  	args[0] != nil ? attributes = args[0] : attributes = {}
  	attributes.each do |k,v|
		xml += %Q( #{k}="#{v}")
  	end

  	if block_given?
  		if @indent
  			@indent_level += 2
  			space = " " * @indent_level
  			xml += ">\n" + space + yield
  			@indent_level = @indent_level - 2
  			space = " " * @indent_level
  			xml +=  space + "</" + method_symbol.to_s + ">\n"
  			
  		else
  			xml + ">" + yield + "</" + method_symbol.to_s + ">"
  		end
  	else
  		if @indent
  			return xml += "/>\n" 
  		else
  			return xml += "/>" 
  		end
  	end
  end
end
