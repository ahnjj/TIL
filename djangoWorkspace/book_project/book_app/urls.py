from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    # 전체 조회
    path('book/list/', views.book_list, name='book_list'),
    # 상세조회
    path('book/detail/<str:bookno>/', views.book_detail, name='book_detail'),
    # 도서 추가
    path('book/insert/', views.book_insert, name='book_insert'),
    # 도서 수정
    path('book/update/<str:bookno>/', views.book_update, name='book_update'),
    # 도서 삭제
    path('book/delete/<str:bookno>/', views.book_delete, name='book_delete'),
    # 도서 검색
    path('book/search_form/', views.book_search_form, name='book_search_form'),
    # 검색 기능
    path('book/search/', views.book_search, name='book_search'),
    
]