class Worker:
    def __init__(self,worker_no, worker_name):
        self.worker_no = worker_no
        self.worker_name = worker_name

    def show_worker_info(self):
        print('사번 : ', self.worker_no)
        print('성명 : ', self.worker_name)