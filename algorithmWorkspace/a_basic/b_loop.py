from string import whitespace


def q1(row, col):
    for i in range(row):
        for j in range(col):
            print('*', end='')
        print()
# star(3,4)

def q2():
    n = int(input("n"))

    for i in range(n):
        for j in range(i+1):
            print("*", end="")
        print()

# q2()


# 사용자로부터 정수를 하나 입력받아
# 사각형을 별로 그리는 데, 대각선에는 숫자를 출력하시오
# 숫자는 1~사용자가 입력한 숫자까지.
# 출력 예시
# 숫자 : 4
# 1***
# *2**
# **3*
# ***4
def q3():
    n = int(input('n: '))
    for i in range(n):
        for j in range(n):
            if i == j:
                print(i+1, end='')
            else:
                print('*', end='')
        print()

# q3()


# 사용자로부터 정수를 하나 입력받아
# 정수만큼의 높이를 가지는 직각삼각형을 * 을 사용해 그리세요
# 이 때 빗변은 해당 행의값을 출력합니다.
# 출력예시 : 숫자 : 5
# 1
# *2
# **3
# ***4
# ****5
def q4():
    n = int(input('n: '))
    for i in range(n):
        for j in range(i+1):
            if i == j:
                print(i+1, end='')
            else:
                print('*', end='')
        print()

# q4()


# 숫자 : 5
# 방향(+ 또는 -) : +
# 	   *				
# 	  ***				
# 	 *****				
# 	*******
#  *********

# 숫자 : 5
# 방향(+ 또는 -) : -
# *********		   
#  *******			   
#   *****			  
#    ***
#     *
def q5():
    # cnt = int(input('n: '))
    cnt = 5
    dir = input('+또는 - : ')
   
    if dir == "+":
        n = 1
        for i in range(cnt):
            for j in range(cnt-n):
                print(' ', end='')
            for j in range(2*n-1):
                print('*', end='')
    
            print()
            n += 1

    elif dir == '-':
        n = cnt
        white_space = 0
        for i in range(white_space):
            # 공백먼저
            for j in range(cnt):
                print('', end='')
            for j in range(2*n-1):
                  print('*', end='')
    
            print()
            n -= 1

# q5()

# 다이아몬드 별찍기
# 사용자로 부터 2이상의 자연수를 입력 받아
# 한 변의 길이가 사용자의 입력값인 다이아몬드를 그려보시오
#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *
def q6():
    cnt = int(input("cnt : "))

    n = 1
    for i in range(cnt):
        for j in range(cnt-n):
            print(' ', end='')
        for j in range(2*n-1):
            print('*', end='')

        print()
        n += 1
    
    n = cnt - 1
    white_space = 1
    for i in range(cnt):
        # 공백먼저
        for j in range(white_space):
            print('', end='')
        for j in range(2*n-1):
            print('*', end='')

        print()
        n -= 1
        white_space += 1

q6()