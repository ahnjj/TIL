weight = float(input("짐의 무게는 얼마입니까? "))

if weight > 20:
    print('무게 초과. 수수료 20,000원')
elif weight <= 20:
    print("수수료 없음")
print("종료합니다.")