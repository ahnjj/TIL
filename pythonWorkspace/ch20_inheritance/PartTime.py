from Worker import *

class PartTime(Worker):
    def __init__(self, worker_no, worker_name, wage, work_time):
        super().__init__(worker_no, worker_name)
        self.wage = wage
        self.work_time = work_time

    def calculate_salary(self):
        return self.wage * self.work_time
    
    def show_pt_info(self):
        
        salary = self.calculate_salary()
        self.show_worker_info()
        print("시급 : ", self.wage, '원')
        print('근무시간 : ',self.work_time, '시간')
        print('급여 :', salary, '원')