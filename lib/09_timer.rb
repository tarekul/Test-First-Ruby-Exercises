class Timer

=begin
A class is a blue print for an object. A class has a 
bunch of methods. When an object is created from a class,
the object inherits the methods of the class
=end

=begin 
An instance variable is a new kind of variable.
Instance variable is available anywhere in the objects
scope. This means that the instance variable is 
accessible and visible by any method that an object has.
=end 
	def seconds(x = 0)
		#Here we are assigning argument x to instance var
		@totalSeconds = x
	end

	def seconds=(x = 0)
		#Here we are assigning argument x to instance var 
		@totalSeconds = x
	end

	def time_string
		#Instance variable is visible in this method
		#because instance variable is in object scope
		#this means any method can see the inst var.
		time = ["00","00","00"]
		if @totalSeconds < 10
		 	time[2] = "0" + @totalSeconds.to_s
		elsif @totalSeconds >= 10 
		 	if @totalSeconds < 60
		 		time[2] = @totalSeconds.to_s
		 	elsif @totalSeconds >=60
		 		minTotal = @totalSeconds / 60
		 		sec = @totalSeconds % 60
		 		hours = minTotal / 60
		 		min = minTotal - (hours * 60)

		 		if sec < 10
					time[2] = "0" + sec.to_s
				elsif sec >= 10
					time[2] = sec.to_s	
				end

				if min < 10
					time[1] = "0" + min.to_s
				elsif sec >= 10
					time[1] = min.to_s	
				end

				if hours < 10
					time[0] = "0" + hours.to_s
				elsif hours >= 10
					time[0] = hours.to_s	
				end
			end
		 end

		 return time.join(":")
	end
end