# 4) write three methods (variant 4)

# method 1 - find the amount of even numbers that are not mutually prime to a given number
def maxprimediv(a,b)
    while b!=0
        a,b = b,a%b
    end
    return a
end
def evnoncoprime_count(n)
    count = 0
    for i in 2..n
        if i%2==0
            count += 1 if maxprimediv(i,n)!=1
        end
    end
    return count
end
puts "#{evnoncoprime_count(21)}"

# method 2 - find maximal digit of a number that are not divided by 3

def maxdigit(a)
    b = -1
    while a!=0
        if (a%10)%3==0
            a = a/10
        elsif (a%10).abs > b
            a,b = a/10, (a%10).abs
        else
            a = a/10
        end
    end
    if b == -1
        puts "none"
    else
        puts "#{b}"
    end
end
maxdigit(123)

# method 3 - [a lot of letters]
