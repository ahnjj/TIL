deposit = int(input('예금액 입력 :'))
interest = float(input('이자율 입력(%) :'))
print("예금액 : {}원".format(deposit))
print('이자율 : {}%'.format(interest))
print('예금이자 : {}원'.format(deposit*interest))
print('잔액 : {}원'.format(deposit+deposit*interest))

print("예금액 : {}원",format(deposit,','))
print('이자율 : {}%',format(interest))
print('예금이자 : {}원',format(deposit*interest,','))
print('잔액 : {}원',format(deposit+deposit*interest,','))

