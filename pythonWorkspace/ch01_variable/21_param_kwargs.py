def show_keyword(**kwargs):
    for key in kwargs.keys():
        print(key, end=' ')
    print()
    for value in kwargs.values():
        print(value, end=' ')
    print()
    for item in kwargs.items():
        print(item)
    print()
    

show_keyword(id='abcd',
             name='kim',
             phone='010-6666-2111')

show_keyword(id='sky',
             name='lee',
             phone='010-2222-2411')