name = ["홍길동", "이몽룡", "성춘향", "변학도"]

search = input('이름 입력 : ')

for i in name:
    if i == search:
        result = 1
        break
    else:
        result = 0

if result:
    print('명단에 있습니다.')
else:
    print('명단에 없습니다.')

