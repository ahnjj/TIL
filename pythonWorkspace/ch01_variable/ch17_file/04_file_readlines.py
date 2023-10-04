import os
currentPath = os.getcwd()
os.chdir(currentPath+"/ch01_variable/ch17_file")


f1 = open('test.txt', 'r',encoding='utf-8')
lines = f1.readlines()
print(lines)
f1.close()


f2 = open('test.txt', 'r',encoding='utf-8')
lines = f2.readlines()

for line in lines:
    print(line, end='')

f2.close()