def get_average(kor,eng,math):
    return (kor+eng+math)/3


kor = int(input('국어 점수를 입력하시오 : '))
eng = int(input('영어 점수를 입력하시오 : '))
math = int(input('수학 점수를 입력하시오 : '))

print('평균 : ', get_average(kor, eng, math))
