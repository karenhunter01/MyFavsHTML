#!/usr/bin/ruby

class Greeting #{
def my_name=(name)
  @username = name
end

def my_name 
	@username
end
end #}

def add_numbers ( parm1, parm2)
   puts "Adding #{parm1} and #{parm2}"
   parm1.to_f + parm2.to_f
end


def multiply_numbers ( parm1, parm2)
   puts "Multiplying #{parm1} and #{parm2}"
   parm1.to_f * parm2.to_f
end


