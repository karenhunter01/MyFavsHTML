
def writeLine(file = "output.txt", line = "")
  mode = "a"
  of = File.open(file, mode)
  of.write(line + "\n")
  of.close
end

file = ""
line = ""
file, line = ARGV

writeLine(file, line)