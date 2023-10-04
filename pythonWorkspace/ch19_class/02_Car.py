class Car:
    def set_car(self):
        self.carNo=''
        self.type=''
        self.company=''
        self.modelYear=0
        self.cc =0

    def show_car_info(self):
        print('차량번호 : ',self.carNo)
        print('차종 : ', self.type)
        print('제조사 : ', self.company)
        print('연식 : ', self.modelYear)
        print('배기량 : ', self.cc)


myCar = Car()
myCar.carNo = "01가1234"
myCar.type = "아반떼"
myCar.company = "현대"
myCar.modelYear = 2023
myCar.cc = 1600

myCar.show_car_info()
                      