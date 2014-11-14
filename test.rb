puts ARGV
str = "adas\\\\\\\\\\\\"
puts str
str.gsub!(/\\/,"\\\\\\\\")
puts str


ss = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+----/.match("1213liangmoru@yeah.net-------136136 liangmoru@yeah.com");
if(ss == nil)
  puts("123")
end

for i in 0 .. ss.size do
puts(ss[i])
end


sss = "12345----12----3456"

p sss.index("--")
