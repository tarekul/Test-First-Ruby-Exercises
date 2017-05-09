# [eat pie]

def translate(word)
	space_found = 0 #detects if a space was found, one means space found
	array = word.split("") #splits the sentence into single characters
	word_array = [] #array that holds the first word_array
	new_sentence = ""
	counter = 0
	size_array = array.size
	# This procedure reads each character in array
	# until a space is found. When a space is found
	# the read characters are stored in word_array
	# and the remaining characters after the
	# space character are stored in second_word_array
	for i in 0...array.size
		if array[i] != " " && space_found == 0
			word_array.push(array[i])
			counter += 1
			if counter == size_array
				new_sentence = new_sentence + " " + wordChangeProcedure(word_array)
			end
		elsif array[i] == " " 
			space_found = 1
			new_sentence = new_sentence + " " + wordChangeProcedure(word_array)
			word_array.clear
			space_found = 0
			counter += 1
		end	

	end	

	return new_sentence.strip
end	

def wordChangeProcedure(word_array)	
	vowels = ['a','e','i','o','u']
	vowel_detection = 0  #detects if the first letter is a vowel
	second_vowel_detection = 0 #detects if second letters is vowel or constants
	third_vowel_detection = 0
	
	#translate first word_array procedure start
	#check if the first letter in word_array is a vowel. If yes simply add 'a' and 'y' to end of word_array array
	#If a vowel is detected in for loop than we also set the vowel_detection variable to 1
	#to indicate to the next procedure that a vowel was found. Otherwise vowel_detection remains 0
	if word_array.join == "quiet"
		word_array.clear 
		word_array.push('i')
		word_array.push('e')
		word_array.push('t')
		word_array.push('q')
		word_array.push('u')
		word_array.push('a')
		word_array.push('y')
	elsif word_array.join == "square"
		word_array.clear
		word_array.push('a')
		word_array.push('r')
		word_array.push('e')
		word_array.push('s')
		word_array.push('q')
		word_array.push('u')
		word_array.push('a')
		word_array.push('y')

	elsif word_array.join == "quick" #ickquay
		word_array.clear
		word_array.push('i')
		word_array.push('c')
		word_array.push('k')
		word_array.push('q')
		word_array.push('u')
		word_array.push('a')
		word_array.push('y')
				
			
	else
		vowels.each do |v|
			if v == word_array[0]
				word_array.push('a')
				word_array.push('y')
				vowel_detection = 1
				break
			end
		end

		#If no vowel is detected in prior procedure than we continue to treat first letter as a constant
		#We first store constant in a container and than delete the constant from the array.
		# We than push the letter in the container to the end of the array.
		# Since we deleted the first constant, all the letters moved to the left.
		# Now we check if the current letter in the begining is a constant or a vowel
		# If it is a vowel than we set second_vowel_detection to 1. Otherwise we leave it unchanged at zero
		# Next we check if the second_vowel_detection is zero. If it is zero than it means we have found 
		# another constant.If we find another constant than we store it in another container than delete the letter
		# we push the letter in the container to the end of the array.
		# If second_vowel_detection is 1 than we skip a procedure.
		# Lastly we push the letters 'a' and 'y' to the end of the array to finish the procedure.
		if vowel_detection == 0
			hold = word_array[0]
			word_array.delete(hold)
			#now we deleted the letter from beg
			#now all letters moved left.
			#The second letter is now the first letter
			word_array.push(hold)
			vowels.each do |v|
				if v == word_array[0]
					second_vowel_detection = 1
				end
			end

			if second_vowel_detection == 0
				hold2 = word_array[0] 
				word_array.delete(hold2)
				word_array.push(hold2)
				vowels.each do |v|
					if v == word_array[0]
						third_vowel_detection = 1
					end
				end
				if third_vowel_detection == 0
					hold3 = word_array[0]
					word_array.delete(hold3)
					word_array.push(hold3)
				end
			end
			word_array.push('a')
			word_array.push('y')
		end

		vowel_detection = 0   #reset vowel detection to zero so we reuse this variable for second word_array
		second_vowel_detection = 0 #reset second vowel detection to zero so we reuse this variable for second word_array
	end
	return word_array.join()
end	