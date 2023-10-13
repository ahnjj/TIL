from django.shortcuts import get_object_or_404, redirect, render
from django.http import JsonResponse
from .forms import BookForm
from .models import Book, Publisher
from django.db.models import Q
import json
from django.core import serializers

def index(request):
    return render(request, 'book_app/index.html')

# 책 전체 조회
def book_list(request):
    # DB 에서 가저온 모든 책 반환
    books = Book.objects.all()
    # publisher = Publisher.objects.all()
    return render(request, 'book_app/book_list.html', {'books':books})


# 책 상세 조회
def book_detail(request, bookno):
    book = get_object_or_404(Book, pk=bookno)
    return render(request, 'book_app/book_detail.html', {'book':book})


# 책 정보 입력
def book_insert(request):
    # (1) 요청 POST 확인
    if request.method == "POST":
        # (2) 입력한 폼 데이터 내용 폼 변수에 저장
        form = BookForm(request.POST)
        # (3) 유효성 검사
        if form.is_valid():
            # (4) 임시 저장
            book = form.save(commit=False)
            # (5) 사용자 입력 데이터 DB에 저장
            book.save()
            # (6) 전체 조회 화면으로 포워딩
            return redirect('book_list')

    else:
        # POST요청이 아닐 경우 빈 폼 리턴
        form = BookForm()
    
    return render(request, 'book_app/book_form.html', {'form':form})

# 책 정보 수정
def book_update(request, bookno):
    # (1) 해당 상품 정보 받아오기
    book = get_object_or_404(Book, pk=bookno)
    # (2) 요청이 POST인지 확인하고
    if request.method == "POST":
        # (3) 원래 작성했던 내용 가져오기
        form = BookForm(request.POST, instance=book)
        # (4) 유효성검사
        if form.is_valid():
            book = form.save(commit=False) # 임시 저장
            # (6) DB에 저장
            book.save()
            return redirect('book_list')
    else:
        form = BookForm(instance=book)
    
    return render(request, 'book_app/book_update.html', {'form':form})



# 책 삭제
def book_delete(request, bookno):
    book = get_object_or_404(Book, pk=bookno)
    book.delete()
    return redirect('book_list')



# 책 검색 page 출력
def book_search_form(request):
    return render(request, 'book_app/book_search_form.html')

# 검색 기능 수행하고 결과 JsonResponse로 반환
def book_search(request):
    if request.method == "POST":
        type = request.POST['type']
        keyword = request.POST['keyword']

        if type == 'bookname':
            book_list = Book.objects.filter(Q(bookname__contains=keyword))
    
        else:
            book_list = Book.objects.filter(Q(bookauthor__contains=keyword))
        # prd_list 쿼리 데이터 셋을 JSON타입으로 변환
        book_list_json = json.loads(serializers.serialize('json', book_list, ensure_ascii=False))
        return JsonResponse({'reload_all':False, 'book_list_json':book_list_json})