from django.shortcuts import render

def index(request):
    return render(request, 'info_app/index.html')

def info(request):
    return render(request, 'info_app/info.html')