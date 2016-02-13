
def printHello(n="",&storeBlock1)
 puts "Before block"
#raise "Test error before Block call"
# storeBlock1.call(n)
  yield n
 puts "After block"
end
 

printHello("Karen") do |p1|
	puts "Print Hello #{p1} from a block"
end

printHello do |p1|
	puts "Print Hello from a block2"
end



