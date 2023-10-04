from django.urls import path
from django.urls.conf import include
from employee import views
from django.contrib import admin

urlpatterns = [
    path('admin/', admin.site.urls),
    path('emp',views.emp),
    path('elist', views.elist),
    path('edit/<int:id>',views.edit),
    path('update/<int:id>',views.update),
    path('delete/<int:id>', views.edelete),
]
