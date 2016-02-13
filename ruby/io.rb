def return_block
  rv = yield || "no block"
puts "#{rv}"
end

#return_block
return_block { "black" }


def readFile(inFile)
  file = File.open("../cobol/installCOBOL.txt")
  filestats = file.stat
  puts "#{inFile} stats"
  puts filestats
end

readFile "../cobol/installCOBOL.txt"



