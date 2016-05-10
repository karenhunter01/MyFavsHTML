#!/usr/bin/ruby

class Journal #{ 

 def createdir

  ### Create directory Structure Recursively ###
  ta = mdir.split("/")
  td = ""
  ta.each { |d|
	if d !=  ""
		td +=  "/" + d
  		if ! Dir.exists?(td)
     			Dir.mkdir(td) 
  		end
	end
  }
 end

 def writeL (ln) 
  jrnlFile= mdir + "/" + mfile
  mode = "a+"
  fh = File.open(jrnlFile,mode)

  puts "Adding to #{jrnlFile}" 
  fh.puts ln 
  fh.close
 end 

 public
  attr_accessor :mfile, :mdir

end #} end class

def nowStr
  "_" + (format "%.4d", Time.now.year) + "_" + (format "%.2d", Time.now.month) + "_" + (format "%.2d",Time.now.day)
end

line = ARGV
now = "jrnl" + nowStr

if line.length > 0
  j1 = Journal.new
  j1.mfile = now
  j1.mdir = "/home/karen/ruby/journal" 
  j1.createdir
  j1.writeL(line.join(" "))
else
puts "Not logging #{line}"
end
