from django.shortcuts import render, redirect
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth import login, logout

from .forms import CustomUserCreationForm
from .models import User
from .forms2 import UserForm

# login
def sign_in(request):
    if request.method == "POST":
        form = AuthenticationForm(request, request.POST)

        if form.is_valid():
            login(request, form.get_user)   # form의 User로 로그인
            return redirect('index')
    else:
        form = AuthenticationForm()

    return render(request, 'users_app/sign_in.html',{'form':form})

def sign_up(request):
    if request.method == "POST":
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            login(request, form.save())
            return redirect('sign_in')  # 회원가입 후 로그인 화면으로 이동
    else: 
        form = CustomUserCreationForm()
    return render(request, 'users_app/sign_up.html',{'form':form})


def sign_up2(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        email = request.POST['email']
        user_name = request.POST['user_name']
        user_phone = request.POST['user_phone']
        user_address = request.POST['user_address']

        user = User.objects.creat_user(username, password, email)
        user.user_name = user_name
        user.user_phone = user_phone
        user.user_address = user_address

        user.save()

        return redirect('sign_in')
    else:
        form = UserForm()
    return render(request, 'users_app/sign_up2.html',{'form':form})


def sign_out(request):
    logout(request)
    return redirect('index')