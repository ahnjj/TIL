import re

string = "ID seoul_777 lived in Seoul in 2015"

# findall(검색어, 문자열)
# 문자열에서 검색어와 일치하는 모든 내용을 리스트로 반환

result = re.findall("[a-zA-Z]+", string)
print(result)


#\D : 숫자 아닌것 = [^0-9] 동일
result = re.findall("[\d]+",string)
print(result)

# \s: space
result = re.findall("[\s]+",string)
print(result)
# [' ', ' ', ' ', ' ', ' ', ' ']

# \w : 문자 + 숫자 [a-zA-Z0-9_]
result = re.findall("[\w]+",string)
print(result)
#['ID', 'seoul_777', 'lived', 'in', 'Seoul', 'in', '2015']

# \W : 문자 + 숫자가 아닌것 [^a-zA-Z0-9_] - 공백만 남음
result = re.findall("[\W]+",string)
print(result)

result = re.findall("[a-zA-Z]+[\d]+",string)
print(result)