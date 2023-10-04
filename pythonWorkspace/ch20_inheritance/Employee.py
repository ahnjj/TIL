class Employee:
    def __init__(self):
        self.emp_no = 1234
        self.emp_name = '홍길동'
        self.emp_dpt = '마케팅'
    def show_emp_info(self):
        print('사번 :', self.emp_no)
        print('성명 :', self.emp_name)
        print('부서 :', self.emp_dpt)
