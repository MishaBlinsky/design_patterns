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
    for i in 0..arr.lenght
        return i if arr[i] > 0
    end
    return -1
end

# 6) Write program that accepts 2 arguments. 1st one tells which method from task 5 to execute, 2nd tells path from where to read array.
