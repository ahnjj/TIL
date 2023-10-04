class Calculator:
    def __init__(self):
        self.num1 = 0
        self.num2 = 0
    
    def input(self):
        self.num1 = int(input('숫자 1 입력 : '))
        self.num2 = int(input('숫자 2 입력 : '))

    def add(self):
        print('덧셈 : ', self.num1+self.num2)

    def multiply(self):
        print('곱셈 : ', self.num1*self.num2)

myCal = Calculator()
myCal.input()
myCal.add()
myCal.multiply()


