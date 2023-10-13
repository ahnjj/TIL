from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('product/list/', views.product_list, name='product_list'),
    # 매개변수 : prd_no(pk)
    path('product/detail/<str:prd_no>/', views.product_detail, name='product_detail'),
    path('product/insert/', views.product_insert, name='product_insert'),
    # 상품수정
    path('product/update/<str:prd_no>/', views.product_update, name='product_update'),
    # 상품 삭제
    path('product/delete/<str:prd_no>/', views.product_delete, name='product_delete'),
    # 상품 검색 창 열기
    path('product/search_form/', views.product_search_form, name='product_search_form'),
    # 상품 검색 쿼리
    path('product/search/', views.product_search, name='product_search'),
    # Ajax 테스트 : page열기
    path('product/ajax_test/', views.ajax_test, name='ajax_test'),
    # Ajax 테스트 : 데이터 전송
    path('product/get_data/', views.get_data, name='get_data'),
    # 검색2 page열기
    path('product/search_form2/', views.product_search_form2, name='product_search_form2'),
    # 검색기능2
    path('product/search2/', views.product_search2, name='product_search2'),
     # 검색3 page열기
    path('product/search_form3/', views.product_search_form3, name='product_search_form3'),
    # 검색기능3
    path('product/search3/', views.product_search3, name='product_search3'),

]