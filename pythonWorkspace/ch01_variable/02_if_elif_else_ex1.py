a = int(input('정수1 입력: '))
b = int(input('정수2 입력: '))
c = int(input('정수3 입력: '))


if a >= b and a >= c:
    print("제일 큰 수 : ",a)
elif b >= c:
    print("제일 큰 수 : ",b)
else:
    print("제일 큰 수 : ",c)