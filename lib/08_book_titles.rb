class Book
  # TODO: your code goes here!
  def title=(t)
  	arr = t.split(" ")
  	arr.each do |word|
  		#stop_words = ["and", "in","the", "of", "a", "an"]
  		stop_words = %w(and in the of a an) 
  		if stop_words.include?(word) 
  			word 
  		else
  			word.capitalize!
  		end
  	end

  	arr[0].capitalize!
  	new_sentence = arr.join(" ")
  	@title = new_sentence
  end

  def title
  	@title
  end
end


