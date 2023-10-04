try:
    num = int(input('숫자 입력 : '))
except ValueError:
    print('숫자가 아닙니다.')
else:
    print(num)


# finally : 리소스들 종료하고 끝날수 있도록
try:
    num = int(input('숫자 입력 : '))
except ValueError:
    pass
else:
    print(num)
finally:
    print('종료')

