from Employee import *


class Manager(Employee):
    def __init__(self):
        super().__init__()
        self.position = '대리'
    
    def show_manager_info(self):
        super().show_emp_info()
        print('직위 : ',self.position)
