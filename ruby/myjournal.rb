# Good resource http://learnrubythehardway.org/book/

class Journal 
 attr_accessor :file, :dir

 def initialize (d, f)
  myarray = Array.new
  self.file = f
  self.dir = d
 end

 def myarray=(line)
	@myarray << line
 end

 def myarray
   myarray.each  { |line| puts line }
 end

 def createDir
   if ! Dir.exists?(dir)
	Dir.mkdir(dir)
  end
 end

 def fh
  fn = dir + "\\" + file
  mode = "a+"
  @fh = File.new(fn, mode)
 end


 def writeLine (line)
  puts "Writing to #{fh}"
  fh.puts line
  fh.close
 end
 
end 


now = format "%.4d", Time.now.year.to_s
now += "_"
now += format "%.2d", Time.now.month.to_i
now += "_"
now += format "%.2d", Time.now.day.to_s
base = "jrnl" + "_" + now
l = ARGV.join(" ")
j1 = Journal.new("C:\\Users\\Karen\\Documents\\MyJournal", base)

if l =~ /[A-Z,a-z0-9]/
  j1.createDir
  j1.fh
  j1.writeLine(l)  
end


