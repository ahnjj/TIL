student = [90, 57, 88, 45, 78]

for idx, score in enumerate(student):
    if score >= 60:
        print(f'{idx+1}번 {score}점 합격')
    else:
        print(f'{idx+1}번 {score}점 불합격')


for score in [90, 57, 88, 45, 78]:
    