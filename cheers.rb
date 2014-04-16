vowels = ["A", "E", "I", "O", "U"]

puts "What's your name?"
name = gets.chomp.upcase
name_length = name.length

while name.empty? or name.to_i.to_s == name
  puts "Please enter your name (it shouldn't be blank or have numbers)"
  puts "What's your name?"
  name = gets.chomp.upcase
end

name.each_char do |character|
  if vowels.include? character
    puts "Give me an... #{character}"
  else
    puts "Give me a... #{character}"
  end
end

if name[name_length -1] == "S"
  puts "#{name} is just GRAND!"
else
  puts "#{name}'s just GRAND!"
end


