money = int(input("교환할 돈은 얼마 입니까? "))

c1 = money//500
c2 = (money%500)//100
c3 = (money%100)//50
c4 = (money%50)//10
c5 = money%10
print('오백원짜리: {}개'.format(c1))
print('백원짜리: {}개'.format(c2))
print('오십원짜리: {}개'.format(c3))
print('십원짜리: {}개'.format(c4))
print('바꾸지 못한 잔돈: {}원'.format(c5))