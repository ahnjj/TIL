# O(n)
def is_prime(num):
    for i in range(2, num):
        if num % i == 0:
            return False
    return True

# 짝수 거르고 하기
def is_prime2(num):
    if num % 2 == 0:
        return False
    for i in range(3,num, 2):
        if num % 2 == 0:
            return False
        
    return True

# 제곱근 기준으로 약수는 대칭됨
def is_prime3(num):
    for i in range(2,int(num**0.5+1)):
        if num % i == 0 :
            return False
    return True


# 최대공약수 
def gcd1(a, b):
    if a == b: return a

    min = a
    if min > b: min = b

    for i in range(min, 0 , -1):
        if a % i == 0 and b % i == 0:
            return i
    