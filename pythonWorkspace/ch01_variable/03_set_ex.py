partyA = set(['Park','Lee', 'Kim'])
partyB = set(['Park','길동','몽룡'])

print('파티에 참석한 모든 사람', partyA|partyB)
print('모든 파티에 참석한 모든 사람', partyA&partyB)
print('파티A에만 참석한 사람', partyA-partyB)
print('파티B에만 참석한 사람', partyB-partyA)