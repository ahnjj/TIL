import os 
currentPath = os.getcwd()
os.chdir(currentPath+'/ch01_variable/ch17_file')



f = open('test2.txt','a',encoding='utf-8')
append_data = "\n\npython programming"
f.write(append_data)
f.close()


f2 = open('test2.txt','r',encoding='utf-8')
print(f2.read())
f2.close()