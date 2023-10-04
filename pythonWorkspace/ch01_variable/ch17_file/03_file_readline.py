# readline 
# 경로 설정
import os
currentPath = os.getcwd()
os.chdir(currentPath+"/ch01_variable/ch17_file")

f1 = open('test.txt','r',encoding='utf-8')
line = f1.readline()
print(line)
f1.close()


f2 =open('test.txt','r', encoding='utf-8')

while True:
    line = f2.readline()
    if not line:
        break
    print(line)  # 행간격 있음

f2.close()

# 행 간격 제거
f2 =open('test.txt','r', encoding='utf-8')

while True:
    line = f2.readline()
    if not line:
        break
    print(line, end='')  # 행간격 있음

f2.close()