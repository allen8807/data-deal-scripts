inFileName = "cred.catch"
inFile = File.new(inFileName,"r")
outFile = File.new(inFileName+".out","w")

while line = inFile.gets
  line.lstrip!
  line.chomp!

  if line.length != 0
    outFile.puts line
  end
end