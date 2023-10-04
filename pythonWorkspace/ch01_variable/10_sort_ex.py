students = []
over = 0
n = int(input('학생수 입력'))

for no in range(n):
    students.append(int(input(f'학생{no+1} 점수 입력 : ')))
    
for student in students:
    if student >= 80:
        over += 1

print('총점 : ', sum(students))
print('평균 : ', sum(students)/5)
print('80점 이상 학생 : {}명'.format(over))
print('점수 내림차순 정렬', sorted(students, reverse=True))
