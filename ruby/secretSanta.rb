#!/usr/bin/ruby

class GiftHat
end

class Person
	attr_reader :name

	def name=(n)
		if "#{n}"  !~ /[a-zA-Z]+/
			raise "Invalid name"
		end
		@name=n
	end
end

