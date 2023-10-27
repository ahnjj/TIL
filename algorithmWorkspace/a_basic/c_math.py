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
    
# euclidean
# a>b일때 a를 b로 나눈 나머지를 r이라고 할때
# a와 b의 최대공약수는 b와 r의 최대공약수와 같다.
# 따라서 나머지가 0이 되었을 때 제수(나누는 수)가 최대공약수
def gcd2(a, b):
    while (b>0):
        a, b = b, a % b
    return a


# 최소 공배수
def lcm(a, b):
    return a * b / gcd2(a,b)

# factorial
def factorial1(n):
    if n < 0 : return -1
    res = 1
    for i in range(1,n+1):
        res *= i
    return res

# factorial recursive
def factorial_recursive(n):
    if n < 0: return -1
    if n == 1 or n == 0: return 1
    return factorial_recursive(n-1) * n

# 꼬리재귀 : 재귀호출의 리턴값이 수식의 일부로 사용되지 않는 재귀함수
# 꼬리재귀 최적화가 지원이 되는 프로그래밍언어 한정
# 컴파일러가 재귀함수를 while문으로 변경하여 실행
# 따라서 실행될 때는 while문이 되므로 stack overflow 터지지 않고 실행속도에도 문제 없음
# 파이썬: 꼬리재귀최적화 지원 X
def factorial_tail(n, result=1):
    if n == 0 or n == 1: return result
    return factorial_tail(n-1, n*result)

