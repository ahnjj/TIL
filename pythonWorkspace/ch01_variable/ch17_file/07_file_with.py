with open('file9.txt','w', encoding='utf-8') as f:
    f.write('with 사용해서 파일에 쓰기')


file = 'file10.txt'
data = '''--python programming
database
django--'''

with open(file, 'w', encoding='utf-8') as f:
    f.write(data)

# read mode
with open(file, 'r') as f:
    print(f.read())