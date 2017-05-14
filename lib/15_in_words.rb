class Fixnum
	def in_words
		#Dictionary of numbers and their spellings. 
		#The spelling of these numbers can not be produced by combining spellings of
		#other numbers. The remaining numbers that ARE NOT in this dictionary
		#can be created by concatenating the spellings of certain numbers in dictionary.
		#For Example:
			# 87 = $numbers_toWords[80] + $numbers_toWords[7] = "eighty seven"
			#Both 80 and 7 are in the dictionary.
		$numbers_toWords = 
		{
			1000 => "thousand",100 => "hundred",90 => "ninety",80 => "eighty",70 => "seventy",
			60 => "sixty",50 => "fifty",40 => "forty",30 => "thirty",20 => "twenty",19=>"nineteen",
			18=>"eighteen",17=>"seventeen", 16=>"sixteen",15=>"fifteen",14=>"fourteen",
			13=>"thirteen",12=>"twelve",11 => "eleven",10 => "ten",9 => "nine",8 => "eight",
			7 => "seven",6 => "six",5 => "five",4 => "four",3 => "three",2 => "two",1 => "one",
		}
		#These IF and ELSIF here are only for convience
		#If a number needed to spell are either 0, 100, or 1000 than I just 
		#simply return the spelling manually. 
		if self == 0 then return "zero"
		elsif self == 100 then return "one hundred"
		elsif self == 1000 then return "one thousand"
		else
			$str = ""
			#Here is where we initally check if the number is in the dictionary already
			#if it is than we just return the value of the key by searching the hash.

			#Check Hash for number
			if $numbers_toWords.has_key?(self)
				return $numbers_toWords[self]
			end
			#End check hash
			#Depending on the number of digits call a function
			if self.to_s.length == 2 then two_digit_num(self)  #e.g 72,84,55
			elsif self.to_s.length == 3 then hundreds(self)	#e.g 200,123,777,512
			elsif self.to_s.length > 3  #e.g. thousands,millions,billions,trillions
				if self.to_s.length <= 6 then thousands(self) #e.g. 2000 , 32767
				elsif self.to_s.length <= 9 then millions(self) #e.g. 10_000_001
				elsif self.to_s.length <=12 then billions(self) #e.g. 1_234_567_890
				elsif self.to_s.length > 12 then trillions(self) end
			end
		end
	end

	def two_digit_num(x)
		if $numbers_toWords.has_key?(x)   #Check if key is in hash
			return $str += $numbers_toWords[x] #concatenate value of key to string
		else
			#Find out what is the second digit from the left.
			second_digit = x % 10   #e.g 87 % 10 = 7 is in hash
			uniqueTens = x - second_digit #e.g 87 - 7 = 80 is in hash
			
			if $numbers_toWords.has_key?(uniqueTens)
				$str += $numbers_toWords[uniqueTens] + " " end #$str = "eighty "
			if $numbers_toWords.has_key?(second_digit)
				$str += $numbers_toWords[second_digit] end #$str = "eighty seven"
		    
		    return $str
		end
	end
	
	def hundreds(x)
		first_digit = x / 100  #e.g. 638 / 100 = 6 
		if first_digit == 0 
			two_digit_num(x)
		else
			if $numbers_toWords.has_key?(first_digit)
				$str += $numbers_toWords[first_digit] + " hundred "  #$str = "six hundred "
				 
			end	

			lastTwo_digits = x % 100 #e.g. 638 % 100 = 38
			if lastTwo_digits != 0
				#check dictionary if the 2 digit number is in their
				if $numbers_toWords.has_key?(lastTwo_digits)
					return $str += $numbers_toWords[lastTwo_digits]
				#Need to break down two digit number so call two_digit_num method
				else
					return two_digit_num(lastTwo_digits)
				end
			else
				return $str.rstrip   #strip away any trailing whitespaces...
			end
		end
	end

	def thousands(x)
		#e.g. 2300/1000 = 2 , 23,000/1000 = 23 , 230,000 / 1000 = 230 
		hold = x/ 1000  # Get first 1,2, or 3 digits
		if hold == 0 then hundreds(x)
		else
			if hold.to_s.length == 1 #e.g. 2 
				$str += $numbers_toWords[hold] + " thousand"
			elsif hold.to_s.length == 2  #e.g 23 is two digit
				two_digit_num(hold)  #call two_digit_num method to find spelling of 23
				$str += " thousand "
			elsif hold.to_s.length == 3 #e.g 230 is three digit
				hundreds(hold) #call hundreds method to find spelling of 230
				$str +=	" thousand " 
			end

			hold2 = x % 1000 #get last 3 digits  230,444 => 444 is last 3 digits		
			hundreds(hold2) #call hundreds to get spelling of 3 digit number
			return $str.rstrip #remove trailing whitespace
		end
	end

	def millions(x)
		# 3,222,111      33,222,111     333,222,111
		hold = x/ 1000000 # Get first 1,2, or 3 digits
		if hold == 0 then thousands(x)
		else
			if hold.to_s.length == 1
				$str += $numbers_toWords[hold] + " million"
			elsif hold.to_s.length == 2
				two_digit_num(hold) 
				$str += " million "	
			elsif hold.to_s.length == 3
				hundreds(hold) 
				$str +=	" million " 
			end	

			hold2 = x % 1000000
			thousands(hold2)
			return $str.rstrip
		end
	end

	def billions(x)
		hold = x/ 1000000000
		if hold == 0 then millions(x)
		else
			if hold.to_s.length == 1
				$str += $numbers_toWords[hold] + " billion " 
			elsif hold.to_s.length == 2
				two_digit_num(hold) 
				$str += " billion " 	
			elsif hold.to_s.length == 3
				hundreds(hold) 
				$str +=	" billion " 
			end	

			hold2 = x % 1000000000
			millions(hold2)
			return $str.rstrip
		end
	end

	def trillions(x)
		hold = x/ 1000000000000
		if hold == 0 then billions(x)
		else
			if hold.to_s.length == 1
				$str += $numbers_toWords[hold] + " trillion " 
			elsif hold.to_s.length == 2
				two_digit_num(hold) 
				$str +=  " trillion " 	
			elsif hold.to_s.length == 3
				hundreds(hold) 
				$str +=	" trillion " 
			end	

			hold2 = x % 1000000000000
			billions(hold2)
			return $str.rstrip
		end
	end
end