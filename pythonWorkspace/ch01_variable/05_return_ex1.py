def get_area(width, height):
    return width*height

width = int(input("가로길이 입력: "))
height = int(input("세로길이 입력: "))
print('사각형의 면적 : ', get_area(width, height))