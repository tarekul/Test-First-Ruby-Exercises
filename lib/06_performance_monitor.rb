require "time"

def measure(*args)
	if args[0]
		start_time = Time.now
		args[0].times { yield }
		end_time = Time.now
		time_elapsed = end_time - start_time
		average_time = time_elapsed / args[0] 
	else
		start_time = Time.now
		yield
		end_time = Time.now
		time_elapsed = end_time - start_time
	end
end