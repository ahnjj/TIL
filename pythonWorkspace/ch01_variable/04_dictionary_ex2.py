dictionary = dict()

while 1:
    word = input('영어 단어 등록 (종료는 quit) : ')
    if word == 'quit':
        break
    if dictionary.get(word, 0) == 0:
        meaning = input(f'{word}의 뜻입력(종료는quit) : ')
        print()
        if meaning == 'quit':
            print()
            break
        else:
            dictionary[word] = meaning
    else:
        print(f'{word}는 이미 등록된 단어 입니다.')
        print()

while 1:
    search = input('검색할 단어 입력 (종료는 quit): ')
    if search == 'quit':
        print('종료합니다.')
        break
    else:
        ans = dictionary.get(search, 0)
        if ans == 0:
            print(f'{search}는 사전에 없는 단어입니다.')
            print()
        else:
            print(f'{search}의 뜻은 {ans}입니다.')
            print()