class Rectangle:
    def __init__(self):
        self.width = 0
        self.height = 0

    def input(self):
        self.width = int(input('가로길이 입력 : '))
        self.height = int(input('세로 길이 입력 : '))

    def show_rect_info(self):
        print('가로길이 : ' , self.width)
        print('세로길이 : ' , self.height)
        print('면적 : ' , self.width*self.height)

# 객체(인스턴스) 생성
r = Rectangle()
r.input()
r.show_rect_info()