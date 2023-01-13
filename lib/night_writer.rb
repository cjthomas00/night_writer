message = File.open(ARGV[0],"r")
counter = message.read.chars.size
message.close


braille = File.open(ARGV[1], "w")
file = ARGV[1]
braille.close

puts "Created '#{file}' containing #{counter} characters"