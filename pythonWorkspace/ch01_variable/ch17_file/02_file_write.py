data = 'hi'
f = open('file4.txt','w')
f.write(data)
f.close()


f = open('file7.txt','w',encoding='utf-8')

for i in range(1,11):
    data = "%d행\n" %i
    f.write(data)

f.close()