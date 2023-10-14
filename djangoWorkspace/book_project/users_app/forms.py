from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model

# built-in form
class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = get_user_model()
        fields = ['username', 'email','user_name','user_phone','user_address']

        labels = {
            'username':'ID',
            'email':'email',
            'user_name':'성명',
            'user_phone':'전화번호',
            'user_address':'주소'
        }