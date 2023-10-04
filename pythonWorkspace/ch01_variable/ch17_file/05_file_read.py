import os 
currentPath = os.getcwd()
os.chdir(currentPath+'/ch01_variable/ch17_file')


f = open('test2.txt','r',encoding='utf-8')
data = f.read()
value = input('입력 : ')

if value in data:
    print('ari')
else:
    print('nai')

f.close()