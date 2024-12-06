require 'prime'
# 1.04 Given an integer array. Print indexes of elements in order that makes array of elements in decresing order.
def sort_indexes_min(arr)
  arr.sort {|a,b| b <=> a}.map {|e| arr.index(e)}
end
# 1.16 Given an integer array. Print elements between first max and second max elements.
def elements_between_1st_2nd_max(arr)
  max1, max2 = arr.max(2)
  id_max1, id_max2 = arr.index(max1), arr.index(max2)
  id_max1, id_max2 = id_max2, id_max1 if id_max1 > id_max2
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
def input_array()
  puts "Enter elements seperated by SPACE:"
  gets.chomp.split.map {|x| x.to_i}
end
puts "1) Print indexes of elements in order that makes array of elements in decresing order.
2) Print elements between first max and second max elements.\n3) Print elements between first and last occurances of max element.
4) Print minimal even element.\n5) Print array of prime dividers of an integer number.\nChoose a task:"
case gets.chomp.to_i
when 1
  puts "Result: #{sort_indexes_min(input_array())}"
when 2
  puts "Result: #{elements_between_1st_2nd_max(input_array())}"
when 3
  puts "Result: #{elements_between_fst_lst_max(input_array())}"
when 4
  puts "Result: #{min_even_element(input_array())}"
when 5
  puts "Enter a number (>=2):"
  puts "Result: #{prime_divs_array(gets.chomp.to_i)}"
end
