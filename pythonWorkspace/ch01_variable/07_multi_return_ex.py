def order():
    price = int(input('상품가격 입력: '))
    num = int(input('주문수량 입력: '))
    return price, num, price*num

p, n, pay = order()
print('상품가격 : {}원'.format(p))
print('주문수량 : {}개'.format(n))
print('주문액 : {}원'.format(pay))
