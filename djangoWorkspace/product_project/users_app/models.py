from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    # 기본 auth_user 테이블과 동일

    # customizing
    # 새로운 필드 추가 (내가 원하는 필드)
    user_name = models.CharField(max_length=30)
    user_phone = models.CharField(max_length=20)
    user_address = models.CharField(max_length=200)