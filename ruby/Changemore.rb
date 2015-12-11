#!/usr/bin/ruby

class Employee #{
  attr_reader :fname, :lname , :salary
  attr_accessor :em_id

  def fname=(n)
	if n =~ /[A-Z,a-z]+/
		@fname = n
	else
		raise "Invalid First Name, try again"
	end
  end

  def lname=(n)
        if n =~ /[A-Z,a-z]+/
                @lname = n
        else
                raise "Invalid First Name, try again"
        end
  end

  def salary=(n)
	hasPeriod=0
	myArr = n.split("")
	
	myArr.each do |d|
		if d !~ /[0-9.]/
			raise "Invalid salary provided"
		end

		if d == "."
			hasPeriod += 1
		end
	end 

	if hasPeriod > 1
		raise "Invalid salary period"
	end

	@salary = n.to_f
  end


  def formatedSalary
	"$%.2f" % @salary
  end
end #}


em1 = Employee.new
em1.fname = "Lucious"
em1.lname = "Lyon"
em1.salary = "2000.00"

puts "#{em1.fname} #{em1.lname} #{em1.formatedSalary}"
