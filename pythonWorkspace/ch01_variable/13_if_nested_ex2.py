
ntbook = 1200000
camera = 400000

print("**************상품 정보**************")
print("1 노트북 :", ntbook)
print("2 디지털 카메라 : ",camera)
print("***********************************")

orderNo = int(input('상품번호 입력:  '))

if orderNo == 1 or orderNo == 2:
    order = int(input('주문수량 입력:  '))

    if orderNo == 1:
        item = '노트북'
        itemPrice = ntbook
    else:
        item = '디지털 카메라'
        itemPrice = camera

    total = itemPrice*order

    if total >= 1000000:
        discountRate = 0.1
    elif total >= 500000:
        discountRate = 0.05
    else:
        discountRate = 0
    
    discountPrice = total*discountRate
    print("**************주문 내용**************")
    print('상품명 : ', item.rjust(12))
    print('가격 : {}원'.format(itemPrice,',').rjust(12))
    print('주문수량 : ', order)
    print('주문액 : {}원'.format(total))
    print('할인액 : {}원'.format(discountPrice))
    print('총지불액 : {}원'.format(total-discountPrice, ',' ))
    
else:   
    print('잘못 입력 하였습니다. 종료합니다.')


