#!/usr/bin/ruby

class GiftHat
	private 
	attr_writer :family_member

	public
	attr_reader: family_member

	def initialize(p)
		@family_member << n
	end
end

class Person
	attr_reader :name

	def initialize(n)
		self.name = n
	end

	def name=(n)
		if "#{n}"  !~ /[a-zA-Z]+/
			raise "Invalid name"
		end
		@name=n
	end
end

