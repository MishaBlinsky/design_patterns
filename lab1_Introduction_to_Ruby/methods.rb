# 4) write three methods (variant 4)

# method 1 - find the amount of even numbers that are not mutually prime to a given number
def max_prime_div(a,b)
    while b! = 0
        a, b = b, a % b
    end
    return a
end
def evev_not_coprime_count(n)
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
    while a! = 0
        if (a % 10) % 3 != 0
            b = (a % 10).abs if (a % 10).abs > b   
        end
        a /= 10
    end
    return b
end
puts "#{max_digit(123)}"

# method 3 - find a product of a max number, that are not mutually prime to a given number and not divided by a min divider of a given number, and a sum of digits of a given number that are lesser than 5

def specprod(a)
    mingivendiv = 2
    while mingivendiv != a and a % mingivendiv != 0
        mingivendiv += 1
    end
    maxnotprime = a
    while maxnotprime != 0
        if maxnotprime % mingivendiv != 0
            break if max_prime_div(maxnotprime,a) != 1
        end
        maxnotprime -= 1
    end
    if maxnotprime == 0
        puts "oopsie - multiplication by zero"
    else
        digitsum = 0
        while a != 0
            digit = (a % 10).abs
            digitsum += digit if digit < 5
            a = (a/10).to_i
        end
        if digitsum == 0
            puts "oopsie - multiplication by zero"
        else
            puts "#{maxnotprime} * #{digitsum} = #{maxnotprime * digitsum}"
        end
    end
end
specprod(123)
