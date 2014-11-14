puts ARGV
str = "adas\\\\\\\\\\\\"
puts str
str.gsub!(/\\/,"\\\\\\\\")
puts str