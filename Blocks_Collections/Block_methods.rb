require 'prime'
# 1.04 Given an integer array. Print indexes of elements in order that makes array of elements in decresing order.
def sort_indexes_min(arr)
  arr.sort {|a,b| b <=> a}.map {|e| arr.index(e)}
end
# 1.16 Given an integer array. Print elements between first max and second max elements.
def elements_between_1st_2nd_max(arr)
  id_max1, id_max2 = arr.max(2).map {|e| arr.index(e)}.sort
  arr[id_max1 + 1...id_max2]
end
# 1.28 Given an integer array. Print elements between first and last occurances of max element.
def elements_between_fst_lst_max(arr)
  max_val = arr.max
  arr[arr.index(max_val) + 1...arr.rindex(max_val)]
end
# 1.40 Given an integer array. Print minimal even element.
def min_even_element(arr)
  arr.select {|e| e % 2 == 0}.min
end
# 1.52 Given an integer number (aka N). Print array of prime dividers of N.
# (note: if there's divider of N that's power of prime divider of N then print smth like "2,2,2" instead of "2")
def prime_divs_array(n)
  arr, arr_output = [*2..n].select {|e| n % e == 0}, []
  arr.select {|e| Prime.prime?(e)}.each do |e|
    count = arr.map {|e2| Math.log(e2, e)}.select {|e2| e2 % 1 == 0}.max
    arr_output += Array.new(count, e)
  end
  arr_output
end
puts "1) Enter via keyboard\n2) Read from a file\nChoose input method:"
input_method = gets.chomp.to_i
if input_method == 1 || input_method == 2
  case input_method
  when 1
    puts "Enter elements seperated by SPACE:"
    arr = gets.chomp.split.map {|x| x.to_i}
  when 2
    begin
      file = File.open("/Users/eduardagejkin/Desktop/ruby/l3_Blocks/text.txt", "r")
      arr = file.read.split.map {|x| x.to_i}
      puts "File loaded successfully"
    rescue Errno::ENOENT => error
      puts "Error: #{error}"
      exit
    ensure
        file.close if file
    end
  end
  puts "1) Print indexes of elements in order that makes array of elements in decresing order.
2) Print elements between first max and second max elements.\n3) Print elements between first and last occurances of max element.
4) Print minimal even element.\n5) Print array of prime dividers of an integer number.\nChoose a task:"
  case gets.chomp.to_i
  when 1
    puts "Result: #{sort_indexes_min(arr)}"
  when 2
    puts "Result: #{elements_between_1st_2nd_max(arr)}"
  when 3
    puts "Result: #{elements_between_fst_lst_max(arr)}"
  when 4
    puts "Result: #{min_even_element(arr)}"
  when 5
    puts "Result: #{prime_divs_array(arr[0])}"
  end
end
