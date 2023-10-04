def get_info():
    info = {}
    name = input('이름 입력 : ')
    age = input('나이 입력 : ')
    info[name] = age
    return info

info_dict = get_info()
print(info_dict)
print(type(info_dict))