### Referencing "Effective Ruby" ######
class ValArgs
 def initialize(parmArray)
   self.myArray = parmArray.dup
   raise ArgumentError.new("Passed Array is invalid") unless array_valid?
 end

 def transform
    puts myArray.map { |x| x.upcase }.join(",")
 end

 public
 attr_reader :myArray

 private
 attr_writer :myArray

 def array_valid?
   myArray.all? { |x| String === x }
 end
end

########################################################

class HashSelect
 def initialize(hash)
  self.hash = hash.dup
 end

 def meaningful_keys
  hash.select! { |k,v|  k == :valid }
 end


 public
 attr_reader :hash
  
 private
 attr_writer :hash

end

mya = ["one", "two", "three"]

obj1 = ValArgs.new(mya) 
obj1.transform
puts "#{obj1.myArray}"

puts "\n\tAdding Fixnum to array"
mya << 2
mya.push(1)
mya << "numbr2"
obj1.transform
puts "#{obj1.myArray}"

puts "\nPrinting scratch variable mya #{mya}"

#############
puts "\n\nHashSelect"
mh = {:invalid => :value, :valid => :valid_value }
h1 = HashSelect.new(mh)
p h1.meaningful_keys
puts mh

####################+++++++++++++++
puts "\n\nThe Ruby for "

def rubyfor(n,arr)
  
end


