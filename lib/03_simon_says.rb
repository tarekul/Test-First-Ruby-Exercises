def echo(str)
	str
end

def shout(str)
	str.upcase
end

def repeat(*args)
	sum = ""
	if args[1] != nil
		x = args[1]
		for i in 1..x
			sum = sum + args[0] + " "
		end
		return sum.chop
		
	
	else
		args[0] + " " + args[0]
	end
end

def start_of_word(str,num)
	total = ""
	for i in 0...num
		total = total + str[i]
	end

	return total 
end

def first_word(str)
	arr = str.split
	return arr[0]
end

def titleize(str)
	arr_str = str.split(" ")
	arr_str.collect! do |word|
		if word == "and" or word == "the" or word == "over"
			word.downcase
		else
			word.capitalize
		end
	end
	
	hold = []
	hold.push(arr_str[0].capitalize)
	for i in 1..arr_str.size - 1
		hold.push(arr_str[i])
	end

	hold.join(" ")
end