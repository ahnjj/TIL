from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model

# 회원가입 폼 : built-in form
# UserCreationForm 상속
class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = get_user_model()   # 모델을 가져오기
        # password는 위에 이미 있기 때문에 가져오지 않는다.
        fields = ['username', 'email', 'user_name', 'user_phone', 'user_address']

        labels = {
            'username': 'ID',
            'email': '이메일',
            'user_name': '성명',
            'user_phone': '전화번호',
            'user_address': '주소',
        }

