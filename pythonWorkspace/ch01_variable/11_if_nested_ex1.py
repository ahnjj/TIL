num = int(input('번호 입력 (1.현금 2.카드): '))

if num not in (1,2):
    print('잘못 입력 하였습니다. 종료합니다.')
else:
    pay = int(input('지불액 입력: '))
    if num == 1:
        discount = 10
    else:
        discount = 5

print('할인율 {}%'.format(discount))
print('할인액:{}원'.format(pay*discount/100))

