def reverser
	yield
	arr = yield.split(" ")
	arr.each do |x|
		x.reverse!
	end

	reverseDone= arr.join(" ")
	return reverseDone
end

def adder(*args)
	if args[0]
		yield + args[0]
	else
		yield + 1
	end
end

def repeater(*args)
	if args[0]
		args[0].times do 
			yield
		end
	else
		yield
	end 
end


