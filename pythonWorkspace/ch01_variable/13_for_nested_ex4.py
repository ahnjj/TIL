for row in range(4):
    for col in range(5):
        print("*",end=' ')
    print()

print()

for row in range(1,6):
    for col in range(row):
        print("*",end=' ')
    print()

print()

for row in range(5):
    for col in range(5-row):
        print("*",end=' ')
    print()
