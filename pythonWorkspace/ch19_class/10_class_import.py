from BookClass import *

book1 = Book(1001, '파이썬','홍길동')
book2 = Book(1002, '데이터베이스','이몽룡')

print('도서번호 :', book1.get_book_no())
print('도서명 :', book1.get_book_name())
print('저자 :', book1.get_book_author())
print("출간된 나라 :", Book.nation)

print()
print('도서번호 :', book2.get_book_no())
print('도서명 :', book2.get_book_name())
print('저자 :', book2.get_book_author())
print("출간된 나라 :", Book.nation)