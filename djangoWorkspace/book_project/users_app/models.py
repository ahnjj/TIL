from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    # 기본 auth_user table

    # custom users fields
    user_name = models.CharField(max_length=30)
    user_phone = models.CharField(max_length=20)
    user_address = models.CharField(max_length=200)