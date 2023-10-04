i = 1
sum = 0

while i<=100:
    if i % 3 == 0:
        sum += i
    i += 1

print('1부터 100까지 모든 3의 배수의 합은',sum,'입니다')