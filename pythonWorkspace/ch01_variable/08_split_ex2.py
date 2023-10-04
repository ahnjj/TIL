str_data = "{a1 : 20}, {a2 : 30}, {a3 : 15}, \
            {a4 : 50}, {a5 : -15}, \
            {a6 : 80}, {a7 : 0}, {a8 : -110}"

 
# str_data = str_data.replace('{',' ').replace('}',' ').replace(":",' ').replace(',',' ')
# num_data = str_data.split(' ')
# res = 0
# for i in num_data:
#     if i != '':
#         if i[0].isdigit() or i[0] =='-':
#             res += int(i)

# print('출력: ',res)
total = 0

str_data = str_data.split(',')

for i in str_data:
    result = i.split(':')[1].split('}')[0]
    total += int(result)


print(total)