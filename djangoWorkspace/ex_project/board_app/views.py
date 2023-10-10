from django.shortcuts import render, redirect
from .form import BoardForm

def board_list(request):
     return render(request, 'board_app/board_list.html')

def board_form(request):

     if request.method == 'POST':
          form = {
               'title': request.POST['name'],
               'content' : request.POST['content']
               }
          
          return render(request, "board_app/board_result.html", {'form':form})        
     return render(request, "board_app/board_form.html")


def board_form2(request):
     form = BoardForm
     if request.method == "POST":
          form = BoardForm(request.POST)
          if form.is_valid():
               title = request.POST.get('title', None)
               content = request.POST.get('content', None)
               return redirect('/')
     return render(request, 'board_app/board_form2.html',{'form':form})