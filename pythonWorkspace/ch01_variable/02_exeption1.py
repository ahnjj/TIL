try:
    print(10/0)
    # print('나이'+23+'살')
except ZeroDivisionError:
    print('에러 예외 처리')


# 여러개 예외 처리
a = [1, 2, 3]

# 1.
try:
    print(10/0)     # 첫 번째 에러 만나면 해당 exception handdler구문으로 이돌
    print(a[4])     # 그 때 이 문장은 수행되지 않음
except ZeroDivisionError:
    print('0으로 나눌수 없습니다.')
except IndexError:
    print('인덱스 범위를 벗어 났습니다.')

# 2.
# exception message : as e

try:
    print(10/0)     # 
    print(a[4])     # 
except (ZeroDivisionError, IndexError) as e:
    print('Exception occurred! : ', e)

