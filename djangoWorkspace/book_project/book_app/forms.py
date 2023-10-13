from django import forms
from .models import Book


class BookForm(forms.ModelForm):
    class Meta:
        model = Book
        fields=[
            'bookno',
            'bookname',
            'bookauthor',
            'bookprice',
            'bookdate',
            'bookstock',
            'pubno'
        ]
        labels = {
            'bookno': '도서번호',
            'bookname' : '도서명',
            'bookauthor' : '저자명',
            'bookprice' : '도서 가격',
            'bookdate' : '출판날짜',
            'bookstock' : '재고',
            'pubno':'출판사'
        }
