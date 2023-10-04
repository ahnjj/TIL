sen = input("문장을 입력하세요")
al, num, spc, etc = 0, 0, 0, 0

for i in sen:
    if i.isalpha():
        al += 1
    elif i.isdigit():
        num += 1
    elif i.isspace():
        spc += 1
    else:
        etc += 1

print('알파벳 : {}개'.format(al))
print('숫자 : {}개'.format(num))
print('스페이스 : {}개'.format(spc))
print('기타 : {}개'.format(etc))
