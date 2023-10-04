def login(id, password):
    if id == 'abcd' and password == '1234':
        print('로그인 성공')
        return show_main()
    else:
        print("로그인 실패")

def show_main():
    print('방문을 환영합니다.')

input_id = input('id 입력 :')
input_pwd = input('비밀번호 입력 :')

login(input_id,input_pwd)