# 세 수 중 최대값 구하기
def max(a,b,c):
    if a > b and a > c:
        return a
    elif b > c:
        return b
    else:
        return c


# 세 수 중 최소값 구하기
def min(a,b,c):
    if a < b and a < c:
        return a
    elif b < c:
        return b
    else:
        return c

# 세 수 중 중간값 구하기
def med(a,b,c):
    if a < b and b < c:
        return b
    elif a < c and c < b :
        return c
    else:
        return a


print(max(55,255,30))
print(min(55,255,30))
print(med(55,255,30))

