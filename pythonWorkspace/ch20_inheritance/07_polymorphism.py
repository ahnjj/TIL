# polymorphism

class Product:
    def __init__(self, name, price):
        self.__name = name
        self.__price = price
    
    def show_item(self):
        print(self.__name, self.__price)

# 일반 함수 정의
# 다형성 : 하나의 객체에 2개의 타입 
# item : Product 타입 / Book 타입의 객체 다 받음
def show_items(item):
    item.show_item()

# 인스턴스(객체) 생성
prd = Product('notebook', 100000)
book = Book('python', 200000)

show_items(prd)
show_items(book)