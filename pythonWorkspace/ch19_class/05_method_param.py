class Person:
    def __init__(self, name, age):   # 생성자
        # 생성자에 매개변수가 있다는 것은
        # 객체 생성 시 반드시 값을 전달해야 한다는 것!!
        # 인스턴스 변수 = 매개변수
        self.name = name
        self.age = age

    # 인스턴스 변수 값 설정(변경)
    def set_name(self, name):
        self.name = name
    def set_age(self, age):
        self.age = age

    def get_name(self):
        return self.name
    
    def get_age(self):
        return self.age
    
p1=Person()