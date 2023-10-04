i = int(input('숫자1 입력 : '))
j = int(input('숫자2 입력 : '))
start = min(i,j)
end = max(i,j)
total = 0

for num in range(start, end+1):
    total += num

print('{}부터 {}까지의 합 : '.format(start, end),total)
