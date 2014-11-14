inFileName = "csdndata.enc"
inFile = File.new(inFileName,"r")
outGBKFile = File.new(inFileName+".gbk.utf8","w")
outOthFile = File.new(inFileName+".other","w")

while line = inFile.gets
  begin
    line_gbk = line.force_encoding("gbk")
    line = line_gbk.encode("utf-8")
  rescue => err
    puts err
    outOthFile.puts(line)
    next
  else
    outGBKFile.puts(line)
    next
  end
end