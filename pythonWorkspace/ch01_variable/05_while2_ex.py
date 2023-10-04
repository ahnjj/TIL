price = 2000
money = 10000
song = 0
while money:
    song += 1
    money -= 2000
    print('노래를 {}곡 불렀습니다.'.format(song))
    if money != 0:
        print('현재 {}원 남았습니다.'.format(money))

print('잔액이 없습니다. 종료합니다.')
    