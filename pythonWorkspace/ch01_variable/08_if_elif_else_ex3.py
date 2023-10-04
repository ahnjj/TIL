a = input('홍길동 입력 : ')
b = input('이몽룡 입력 : ')

if (a == '바위' and b == '가위') or \
    (a == '가위' and b == '보') or  \
    (a == '보' and b == '바위'):
    win = '홍길동'
elif a == b:
    win = '비겼습니다.'
else:
    win = '이몽룡'

print(win)