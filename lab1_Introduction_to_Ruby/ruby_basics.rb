# 1) output "hello world" with commentary
puts "Hello WARUDO"

# 2) Accept username as program's argument. Say hello to user using string formatting. Ask their favourite language with various answers.
user_name = ARGV[0]
puts "Hello, #{user_name}!"
print "What's your favourite language? "
language = STDIN.gets.chomp.downcase
case language
    when "ruby"
        puts "Liar trying to appease me"
    when "pascal"
        puts "I see you're middle schooler"
    when "c++"
        puts "Unsurprising"
    when "sharp"
        puts "Soon it'll be Ruby"
    else
        puts "Nevermind"
end
