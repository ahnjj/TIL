# 이메일 유효성 확인
# 이메일 형식
# - 시작 문자와 숫자가 2개 이상 / @ /문자 2개 이상/ .문자 / 끝에는 2개 이상 소문자
# ^ : 시작
# $ : 끝
# \. : 특수문자 (.)
import re

email = input("input your email : ")
result = re.findall("^[a-zA-Z0-9]{2,}@[a-zA-Z]{2,}\.[a-z]", email)

print(email, end = ' ')

if len(result) == 0 :
    print("잘못된 이메일")
else:
    print('올바른 이메일 형식')
