from django.urls import path, include
from .views import BookAPIMixins, BooksAPIMixins, HelloAPI, booksAPI, bookAPI, BookAPI, BooksAPI

urlpatterns = [
    path('hello/', HelloAPI),
    # FBV
    path('fbv/books/', booksAPI),
    path('fbv/book/<int:bid>/',bookAPI),
    # CBV
    path('cbv/books/', BooksAPI.as_view()),
    path('cbv/book/<int:bid>/', BookAPI.as_view()),
    # Mixin
    path('mixin/books/', BooksAPIMixins.as_view()),
    path('mixin/book/<int:bid>/', BookAPIMixins.as_view()),
]