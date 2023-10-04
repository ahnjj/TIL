# 현재 경로 확인
import os
print(os.getcwd())



f = open('file1.txt','w')
f.close()

# 존재하지 않는 디렉터리에 생성하면 에러
# f = open('c:/myFolder/file1.txt','w')

f = open("/Users/jeong_ahn/pythonWorkspace/ch01_variable/ch17_file/file2.txt",'w')