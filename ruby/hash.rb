
str = "I'm a nobody, who are you. are you nobody too. then there's the pair of us, don't tell"

## Empty Hash ##
result = {}
str.split(" ").each do |word|
 result[word] ||= 0
 result[word] += 1
end
p result

####################################

result1 = Hash.new { |hash, key| hash[key] = [] }
str.split(" ").each_with_index do |word, index|
  result1[index] << word
end

puts "---------------"
p result1
puts "---------------"


####################################
puts "\n"
myweakhash = Hash.new("Karen, Hunter") # value hash
myHash ={ "me" => "Karen Hunter", "husband" => "Terence Hunter" }

 myHash.each_key { |k|
 puts "#{myHash[k]}" 
}