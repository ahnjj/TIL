from Parent import *

class Child(Parent):            # parent 상속
    def __init__(self):
        super().__init__()      # 부모 생성자 호출
        self.__c = 20
