class Fixnum
	def in_words
		$numbers_toWords = 
		{
			1000 => "thousand",
			100 => "hundred",
			90 => "ninety",
			80 => "eighty",
			70 => "seventy",
			60 => "sixty",
			50 => "fifty",
			40 => "forty",
			30 => "thirty",
			20 => "twenty",
			19=>"nineteen",
			18=>"eighteen",
			17=>"seventeen", 
			16=>"sixteen",
			15=>"fifteen",
			14=>"fourteen",
			13=>"thirteen",              
			12=>"twelve",
			11 => "eleven",
			10 => "ten",
			9 => "nine",
			8 => "eight",
			7 => "seven",
			6 => "six",
			5 => "five",
			4 => "four",
			3 => "three",
			2 => "two",
			1 => "one",
			 
		}
		if self == 100
			return "one hundred"
		elsif self == 0
			return "zero"
		elsif self == 1000
			return "one thousand"
				
				
		else
			$str = ""
			$numbers_toWords.each do |k,v|
				if self == k 
					return $str + v
				end
			end

			if self.to_s.length == 2
				two_digit_num(self)
			elsif self.to_s.length == 3	
				hundreds(self)
			elsif self.to_s.length > 3 
				if self.to_s.length <= 6
					thousands(self)
				elsif self.to_s.length <= 9
					millions(self)
				elsif self.to_s.length <=12
					billions(self)
				else
					trillions(self)		
				end
					
			end
		end
	end

	def two_digit_num(x)
		if $numbers_toWords.has_key?(x)
			$numbers_toWords.each do |k,v|
				if x == k 
					return $str += v
				end
			end
		else
			second_digit = x % 10 
			uniqueTens = x - second_digit
			$numbers_toWords.each do |k,v|
				if uniqueTens == k
					$str += v + " "
				end
			end	
			$numbers_toWords.each do |k,v|
				if second_digit == k
					$str += v 
				end	
			end
			return $str
		end
	end
	
	def hundreds(x)
		first_digit = x / 100 
		$numbers_toWords.each do |k,v|
			if first_digit == k
				$str += v + " " + "hundred" + " "
			end
		end	

		lastTwo_digits = x % 100
		if lastTwo_digits != 0
			if $numbers_toWords.has_key?(lastTwo_digits)
				$numbers_toWords.each do |k,v|
					if lastTwo_digits == k
						return $str += v
					end
				end	
			else
				return two_digit_num(lastTwo_digits)
			end
		else
			return $str.rstrip
		end

		
	end

	def thousands(x)
		hold = x/ 1000
		if hold.to_s.length == 1
			$numbers_toWords.each do |k,v|
				if hold == k
					$str += v + " " + "thousand"
				end
			end
			
		elsif hold.to_s.length == 2
			two_digit_num(hold) 
			$str += " " + "thousand" + " "
		elsif hold.to_s.length == 3
			hundreds(hold) 
			$str +=	 " " + "thousand" + " "
		end

		hold2 = x % 1000		
		hundreds(hold2)
		return $str.rstrip
	end

	def millions(x)
		hold = x/ 1000000
		if hold.to_s.length == 1
			$numbers_toWords.each do |k,v|
				if hold == k
					$str += v + " " + "million"
				end
			end
		elsif hold.to_s.length == 2
			two_digit_num(hold) 
			$str += " " + "million" + " "	
		elsif hold.to_s.length == 3
			hundreds(hold) 
			$str +=	 " " + "million" + " "
		end	

		hold2 = x % 1000000
		thousands(hold2)
		return $str.rstrip
	end

	def billions(x)
		hold = x/ 1000000000
		if hold.to_s.length == 1
			$numbers_toWords.each do |k,v|
				if hold == k
					$str += v + " " + "billion" + " "
				end
			end
		elsif hold.to_s.length == 2
			two_digit_num(hold) 
			$str += " " + "billion" + " "	
		elsif hold.to_s.length == 3
			hundreds(hold) 
			$str +=	 " " + "billion" + " "
		end	

		hold2 = x % 1000000000
		millions(hold2)
		return $str.rstrip
	end

	def trillions(x)
		hold = x/ 1000000000000
		if hold.to_s.length == 1
			$numbers_toWords.each do |k,v|
				if hold == k
					$str += v + " " + "trillion" + " "
				end
			end
		elsif hold.to_s.length == 2
			two_digit_num(hold) 
			$str += " " + "trillion" + " "	
		elsif hold.to_s.length == 3
			hundreds(hold) 
			$str +=	 " " + "trillion" + " "
		end	

		hold2 = x % 1000000000000
		billions(hold2)
		return $str.rstrip
	end
end