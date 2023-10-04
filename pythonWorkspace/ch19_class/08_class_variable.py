class Calculation:
    total = 0       # 클래스 변수

    def __init__(self, num):
        self.__num = num
        self.add_to_total()

    # 클래스 변수 total 
    def add_to_total(self):
        Calculation.total += self.__num

    def show(self):
        print("num :", self.__num)
        print("total :", Calculation.total)


c1 = Calculation(10)
c1.show()

c2 = Calculation(20)
c2.show()