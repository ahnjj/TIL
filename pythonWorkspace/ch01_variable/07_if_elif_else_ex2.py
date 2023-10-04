from math import pi

type = int(input('도형입력 (1:사각형, 2: 삼각형, 3: 원)'))

if type == 1:
    width = float(input('가로 입력: '))
    height = float(input('세로 입력: '))
    print('사각형의 면적 = ', width*height)
elif type == 2:
    base = float(input('밑변 입력: '))
    height = float(input('높이 입력: '))
    print('삼각형의 면적 = ', base*height*0.5)
else:
    radius = float(input('반지름 입력: '))
    print('원의 면적 = ', radius**2*pi)