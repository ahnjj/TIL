from django import forms
from .models import User

# ModelForm상속
class UserForm(forms.ModelForm):
    class Meta:
        model = User

        # 순서대로 넣어야함! 주의
        fields = [
            'username',
            'password',
            'email',
            'user_name',
            'user_phone',
            'user_address'
                  ]
        
        labels = {
            'username' : 'ID',
            'password' : '비밀번호',
            'email' : '이메일',
            'user_name' : '성명',
            'user_phone' : '전화번호',
            'user_address' : '주소'
        }