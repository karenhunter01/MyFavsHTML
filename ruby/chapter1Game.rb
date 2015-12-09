#!/usr/bin/ruby


n = rand(10);
puts "\nPlease enter your name: "
username = gets
username = username.chomp
max=10
min=0

puts username + ", guess a number from 1 - 10\n";
while min <= 10
	guess = gets;
	if  guess.to_i == n 
		print "\nGood Job, You got it!!";
		print "\nRandom number is " + n.to_s;
		min = 11;
	elsif  guess.to_i < n 
		print "\nToo LOW, try again";
	else 
		print "\nToo HI, try again";
	end
	min += 1;
	puts 

end


puts "\n\n"
