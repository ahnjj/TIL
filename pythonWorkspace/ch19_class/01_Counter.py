# class 정의
class Counter:
    # 인스턴스 변수 count 를 0으로 초기화하는 메소드
    def set_count(self):
        self.count = 0

    # 인스턴스 변수 count 1 증가하는 메소드
    def increment(self):
        self.count += 1
    
    def get_count(self):
        return self.count
    

c1= Counter()
c2= Counter()

c1.set_count()
c1.increment()

print(c1.get_count())