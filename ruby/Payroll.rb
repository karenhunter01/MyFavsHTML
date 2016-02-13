class Employee
  attr_reader :fname, :lname, :salary

  def fname=(n)
	if n =~ /[A-Za-z]/
		@fname = n
	else
		raise "Invalid fname (first name) provided"
	end
  end

  def lname=(n)
	if n =~ /[A-Za-z]/
		@lname = n
	else
		raise "Invalid lname last name) provided"
	end
  end

  def salary=(d)
	periodSplit = d.to_s.split("\.")
	if periodSplit.size > 2
		raise "Invalid salary provided. There are more decimal points than one; size is #{periodSplit.size}"
	end

	if d < 0 	
		raise "Error: Salary cannot be less than zero"
	end

	@salary = d
  end

  def initialize(fn="Jane", ln="Doe", s=0.00)
	self.fname=fn.to_s
	self.lname=ln.to_s
	self.salary=s.to_f
	puts "Adding Employee #{fname} #{lname}"
  end

  def printPayStub
	format("%s, %s $%0.2f", lname, fname, salary)
  end  
end

e1 = Employee.new("Jane", "Pitman", 546563.56)
r = e1.printPayStub
puts "Pay Stub: #{r}"