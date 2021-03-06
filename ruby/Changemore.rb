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

   	fa = salary.to_s.split(".")
	work1 = fa[0].reverse
	work1 = work1.split('')
	cnt=0
	work2=""
	work1.each { |l| 
		if cnt == 0 
			work2 =  l
			cnt += 1
		end
		if cnt == 3
			work2 += ','
			work2 += l
			cnt = 1

		elsif cnt < 3
			work2 += l
			cnt += 1
		end
	}
	work2 = work2.reverse
	return work2
  end
end #}


em1 = Employee.new
em1.fname = "Lucious"
em1.lname = "Lyon"
em1.salary = "2000.00"

puts "#{em1.fname} #{em1.lname} #{em1.formatedSalary}"
