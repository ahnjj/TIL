class Book:
    nation = "korea"

    def __init__(self,book_no, book_name, book_author):
        self.book_no = book_no
        self.book_name = book_name
        self.book_author = book_author
        self.price = 0
        self.stock = 0
        self.company = ''

    def get_book_no(self):
        return self.book_no
    
    def get_book_name(self):
        return self.book_name
    
    def get_book_author(self):
        return self.book_author
    
