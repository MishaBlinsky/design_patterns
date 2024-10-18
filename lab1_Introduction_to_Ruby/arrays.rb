# 5) Write 2 methods that find min element and 1st positive element in an array, respectively. Use for and/or while.

def find_min_elem (arr)
    return nil if arr.empty?
    min = arr[0]
    for el in arr
        min = el if el < min
    end
    return min
end

def find_1st_pos_elem (arr)
    return nil if arr.empty?
    for i in 0..arr.length
        return i if arr[i] > 0
    end
    return -1
end

# 6) Write program that accepts 2 arguments. 1st one tells which method from task 5 to execute, 2nd tells path from where to read array.

def main()
    method_n = ARGV[0].to_i
    file_path = ARGV[1].chomp
    if (method_n == 1 || method_n == 2)
        if File.exist?(file_path)
            file = File.read(file_path)
            arr = file.split(' ').map{|el| el.to_i}
            case method_n
                when 1
                    puts "Min element: #{find_min_elem(arr)}"
                when 2
                    puts "1st pos element id: #{find_1st_pos_elem(arr)}"
            end
        else
            puts "File not found!"
        end
    else
        puts "Incorrect method number!"
    end
end
main()
