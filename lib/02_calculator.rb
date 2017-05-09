def add(num1,num2)
	num1 + num2 
end

def subtract(num1,num2)
	num1 - num2
end

def multiply(*args)
	result = 1
	args.each do |i|
		result *= i
	end

	return result
end



def sum(arr)
	sum = 0
	arr.each do |i|
		sum = sum + i
	end

	sum
end

def power(base,exponent)
	base ** exponent
end

def factorial(num)
	result = 1
	if(num == 0)
		return 1
	elsif num == 1
		return 1
	else
		loop do
			break if num == 0
			result = result * num
			num -= 1
		end
		return result
	end
end

			