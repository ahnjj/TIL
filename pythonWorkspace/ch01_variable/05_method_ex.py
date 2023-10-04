email = input("이메일 입력 : ")
correct = True

if email.find('@') or email.find('.'):
    correct = False
elif email.index('@') - email.index('.') < -2:
    correct = False
elif email.index('@') == 0 or email.index('.') == len(email)-1: 
    correct = False
elif email.count('@') >= 2 or email.count('.') >= 2:
    correct = False

if not correct:
    print("이메일 형식이 아닙니다.")
    print('입력한 이메일 :', email)