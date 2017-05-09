class Friend
  # TODO: your code goes here!
  def greeting(who = nil)
  	if who == nil
  		return "Hello!"
  	else
  		return "Hello, " + who + "!"
  	end
  end
end
