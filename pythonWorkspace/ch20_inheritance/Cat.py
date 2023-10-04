from Animal import *

class Cat(Animal):
    def sound(self):
        print('야용')
        super().sound()
    