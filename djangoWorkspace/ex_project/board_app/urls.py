# board_app/urls.py
from django.urls import path
from . import views

urlpatterns = [
    path('', views.board_list, name='board_list'),
    path('form/', views.board_form, name='board_form'),
    path('form2/', views.board_form2, name='board_form2'),
]