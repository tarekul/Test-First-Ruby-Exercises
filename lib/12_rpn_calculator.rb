class RPNCalculator
  # TODO: your code goes here!
  def initialize 
  	@stack = []
  end  
  
  def push(num)
  	@stack.push(num)
  end

  def plus
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
  		@stack.push(@stack.pop + @stack.pop)
  	end
  end

  def minus
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
  		num2 = @stack.pop
  		num1 = @stack.pop
  		@stack.push(num1 - num2)
  	end
  end

  def times
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
  		@stack.push(@stack.pop * @stack.pop)
  	end
  end

  def divide
  	if @stack.length < 2
  		raise "calculator is empty"
  	else
  		num2 = @stack.pop
  		num1 = @stack.pop
  		@stack.push(num1 / num2.to_f)
  	end
  end
  
  def value
  	if @stack.length < 1
  		raise "calculator is empty"
  	else
  		@stack[-1]
  	end
  end

  def tokens(input)
 	tokens = input.split(" ")
 	tokens.collect! do |x|
 		if x == "+"
 			x = :+
 		elsif x == "-"
 			x = :-
 		elsif x == "/"
 			x = :/
 		elsif x == "*"
 			x = :*
 		else
 			x = x.to_i
 		end
 	end
 	return tokens			
 				
  end

  def evaluate(input)
  	expression = tokens(input)
  	expression.each do |x|
  		if x.is_a? Integer
  			push(x)
  		elsif x == :+
  			plus
  		elsif x == :-
  			minus
  		elsif x == :*
  			times
  		elsif x == :/
  			divide
  		end
  	end
  	@stack[-1]					
  end
  
end
