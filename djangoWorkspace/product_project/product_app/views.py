from django.http import JsonResponse
from django.shortcuts import get_object_or_404, redirect, render
from .forms import ProductForm
from .models import Product
from django.db.models import Q
import json
from django.core import serializers

def index(request):
    return render(request, 'product_app/index.html')

def product_list(request):
    # DB에서 select한 결과 반환(모든 상품 데이터 반환)
    # objects.all()사용
    products = Product.objects.all()
    return render(request, 'product_app/product_list.html',{'products':products})

# 상세 상품 조회
# 전달받은 prd_no에 해당되는 1개 상품 데이터 반환
def product_detail(request, prd_no):
    # prd_no 조건에 맞는 행 SELect
    # get_object_or_404() 사용
    product = get_object_or_404(Product, pk = prd_no)
    return render(request, 'product_app/product_detail.html',{'product':product})

# 상품 등록
def product_insert(request):
    # (1)요청이 POST인지 확인하고
    if request.method == 'POST':
        # (2) form data의 내용 폼 변수에 저장
        form = ProductForm(request.POST)
        # (3) django 기본기능인 is_valid() 사용해서 데이터 유효성 확인
        if form.is_valid():
            # (4)form에 저장된 데이터를 아직 완전 저장하지 않고, 다른 작업이 있을 경우 (임시로)
            # (사실 현재는 이 부분 없어도 됨)
            product = form.save(commit=False)
            # 수행할 작업이 있다면 여기서 수행 (우리는 현재 다른 작업없으므로 생략)
            # product....() 작업
            # (5) 입력한 데이터 지금 DB에 완전 저장
            product.save()
            # (6) DB에 저장 후 결과 확인하기 위해 상품조회 화면으로 이동 (forwarding)
            # redirect() 
            return redirect('product_list')
    else:
        # 빈 폼 객체 만들기
        form = ProductForm()
    # (7) else POST요청이 아니라면 입력 폼 그대로 출력(빈 폼 다시 보여주기)
    return render(request,'product_app/product_form.html',{'form':form})



# 상품정보 수정
def product_update(request, prd_no):
    # (1) 전달받은 prd_no에 해당되는 상품 정보 가져와서
    product = get_object_or_404(Product, pk=prd_no)
    # (2) 요청이 POST 인지 확인하고
    if request.method == "POST":
        # (3) 가져온 Product 데이터의 내용을 form변수에 저장 (이전에 입력된 상품 정보 가져오기)
        form = ProductForm(request.POST, instance=product)
        # (4) django 기본 기능 is_valid()유효성 검사
        if form.is_valid():
            # (5) form 에 저장된 데이터를 아직 완전 저장하지 않고
            product = form.save(commit=False)
            # (6) 여기서 DB에 저장
            product.save()
            # (7) DB에 저장후 결과 확인 위해 상품조회 화면으로 이동(forwarding)
            return redirect('product_list')
    else:
        
        form = ProductForm(instance=product) # 처음 폼 화면 출력
        # 폼에 prd_no에 해당되는 상품 데이터 출력
    # (8) Else: POST이 아닐 경우 입력 폼 그대로 출력
    return render(request, 'product_app/product_update.html', {'form':form})

# 상품 삭제
def product_delete(request, prd_no):
    # prd_no에 해당되는 상품 찾아와서
    product = get_object_or_404(Product, pk=prd_no)

    # 상품 데이터 삭제
    product.delete()

    # 상품 조회 화면으로 이동
    return redirect('product_list')


# 검색창 열기
def product_search_form(request):
    return render(request, 'product_app/product_search_form.html')

# 검색 쿼리 수행
def product_search(request):
    if request.method == "POST":
        type = request.POST['type']
        keyword = request.POST['keyword']
        print(type, keyword)
        prd_list = Product.objects.filter(Q(prd_name__contains=keyword)|Q(prd_maker__contains=keyword))

        return render(request, 'product_app/product_search_form.html', {'prd_list':prd_list})
    
def ajax_test(request):
    return render(request, 'product_app/ajax_test.html')

# Ajax 연습 : 데이터만 전송
def get_data(request):
    data = {'name':'홍길동'}

    return JsonResponse(data)

# Ajax를 사용한 검색
# 검색창 열기
def product_search_form2(request):
    return render(request, 'product_app/product_search_form2.html')


# 검색 기능 수행하고 결과를 JsonResponse로 반환
def product_search2(request):
    if request.method == "POST":
        type = request.POST['type']
        keyword = request.POST['keyword']

        print(type, keyword)

        # prd_list = Product.objects.filter(Q(prd_name__contains=keyword) | Q(prd_maker__contains=keyword)) 

        if type == 'prd_no':
            prd_list = Product.objects.filter(Q(prd_name__contains=keyword))
        # 제조회사로 검색
        else:
            prd_list = Product.objects.filter(Q(prd_maker__contains=keyword))
    
        # prd_list 쿼리 데이터 셋을 JSON 타입으로 변환
        prd_list_json = json.loads(serializers.serialize('json', prd_list, ensure_ascii=False))

        return JsonResponse({'reload_all':False, 'prd_list_json':prd_list_json})
    

# 검색창3
def product_search_form3(request):
    return render(request, 'product_app/product_search_form3.html')



# 검색기능 3
def product_search3(request):
    if request.method == "POST":
        type = request.POST['type']
        keyword = request.POST['keyword']

        print(type, keyword)

        # prd_list = Product.objects.filter(Q(prd_name__contains=keyword) | Q(prd_maker__contains=keyword)) 

        if type == 'prd_name':
            prd_list = Product.objects.filter(Q(prd_name__contains=keyword))
        # 제조회사로 검색
        else:
            prd_list = Product.objects.filter(Q(prd_maker__contains=keyword))
    
        # prd_list 쿼리 데이터 셋을 JSON 타입으로 변환
        prd_list_json = json.loads(serializers.serialize('json', prd_list, ensure_ascii=False))

        return render(request, 'product_app/product_search3_result.html', {'prd_list':prd_list})
