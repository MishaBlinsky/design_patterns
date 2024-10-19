# 4) write three methods (variant 4)

# method 1 - find the amount of even numbers that are not mutually prime to a given number
def max_prime_div(a,b)
    while b != 0
        a, b = b, a % b
    end
    return a
end
def even_not_coprime_count(n)
    count = 0
    for i in 2..n
        if i % 2 == 0
            count += 1 if max_prime_div(i, n) != 1
        end
    end
    return count
end
puts "#{even_not_coprime_count(21)}"

# method 2 - find maximal digit of a number that are not divided by 3

def max_digit(a)
    b = -1
    while a != 0
        if (a % 10) % 3 != 0
            b = (a % 10).abs if (a % 10).abs > b   
        end
        a /= 10
    end
    return b
end
puts "#{max_digit(123)}"

# method 3 - find a product of a max number, that are not mutually prime to a given number and not divided by a min divider of a given number, and a sum of digits of a given number that are lesser than 5

def spec_prod(a)
    min_a_div = 2
    while min_a_div != a and a % min_a_div != 0
        min_a_div += 1
    end
    max_not_coprime = a
    while max_not_coprime != 0
        if max_not_coprime % min_a_div != 0
            break if max_prime_div(max_not_coprime, a) != 1
        end
        max_not_coprime -= 1
    end
    digit_sum = 0
    while a != 0
        digit = (a % 10).abs
        digit_sum += digit if digit < 5
        a = (a/10).to_i
    end
    return "#{max_not_coprime} * #{digit_sum} = #{max_not_coprime * digit_sum}"
end
puts "#{spec_prod(123)}"
