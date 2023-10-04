import re
string = "Thoe are my books writen by Mr. Kook."

# + : 최소 1번 이상 (단어단위)
result = re.findall('o+', string)
print(result)


# * : 최소 0번 이상 (단어단위)
result = re.findall('o*', string)
print(result)

# {1, 5} : 최소 1~5번 이상 (단어단위)
result = re.findall('o{1,5}', string)
print(result)

# 섞어서 : 0최소 1번이상 반복 다음에k
result = re.findall('o{1,}k', string)
print(result)