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
print(evnoncoprime_count(21),"\n")

# method 2 - find maximal digits of a number that are not divided by 3

# method 3 - [a lot of letters]
