cities = '인천 대전 광주 울산 대구 부산'

city = input("우리 나라 광역시 중 하나 입력 : ")

if cities.find(city):
    print("정답입니다.")
else:
    print('틀렸습니다.')