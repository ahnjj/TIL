from random import randrange

you = input('You 입력:')
com = randrange(1,4)
if com == 1:
    com = '가위'
elif com == 2:
    com = '바위'
else:
    com = '보'

if (you == '바위' and com == '가위') or \
    (you == '가위' and com == '보') or  \
    (you == '보' and com == '바위'):
    win = '당신이 이겼습니다.'
elif you == com:
    win = '비겼습니다.'
else:
    win = '컴퓨터가 이겼습니다.'

print(win)
print('컴퓨터는 {}입니다.'.format(com))