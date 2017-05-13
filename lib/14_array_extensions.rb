class Array
	def initialize
		return :sum
	end

	def sum
		total = 0
			self.each do |element|
				total += element
			end
		return total
	end

	def square
		new_array = []
		self.each do |element|
			new_array.push(element * element)
		end
		return new_array
	end

	def square! 
		self.collect! do |element|
			element * element
		end
		return self
	end
end