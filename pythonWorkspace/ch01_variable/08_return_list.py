def get_names():
    names = []
    for i in range(3):
        names.append(input('이름 입력 : '))
    return names

name_list= get_names()
print(name_list)
print(type(name_list))