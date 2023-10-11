# MySQL 연동 : CRUD구현

[[django]Issue](https://www.notion.so/django-Issue-45d0bc7d180a4fdd990ebf093e874ade?pvs=21)

### 프로젝트 전체 작업순서

1. 프로젝트생성
2. 앱생성
    1. nvbar.html
    2. base.html
    3. 모든 템플릿에서 base.html 포함
3. DB 연동
    1. mysqlclient 패키지 설치
    2. db_settings.py새로 생성
        - DB 연결 정보
    3. model 생성 (migration)
    

# 구현작업

---

[ 작업 순서(시작 셋팅)](https://www.notion.so/dfa08c04728840169744db7cd9f62b92?pvs=21)

- 1.index
    - app/templates/ index.html 만들고
    
    ```python
    
    ```
    
    - Index view만들기
    
    ```python
    # app/views.py
    def index(request):
        return render(request, 'book_app/index.html')
    ```
    
    - index url
    
    → runserver 돌고 있는지 확인! 꼭 확인! (페이지 출력되나)
    
- 2. Templates 관리 (공통 layout, templates경로)
    - 모든 페이지에 공통되는 base.html 만들기
    - 프로젝트 폴더에 templates폴더 생성
        - nvbar.html (menu bar)
        
        ```html
        <nav>
            <ul>
                <li><a href="{% url 'index' %}">HOME</a></li>
            </ul>
        </nav>
        ```
        
        - base.html
        
        ```html
        {% load static %}
        <!DOCTYPE html>
        <html>
        <head>
            <meta charset="UTF-8">
            <title>Base 페이지</title>
            <link rel="stylesheet" href="{% static '/css/product.css' %}">
            
        </head>
        <body>
            <div id="wrap">
                {% include "nvbar.html" %}
                <hr>
                {% block content %}
                {% endblock %}
            </div>
        </body>
        </html>
        ```
        
        - 🔥 **settings.py 에서  BASE_DIR설정**
            - 프로젝트 안의 템플릿 폴더에 넣은 것이므로 한뎁스 더 들어간다.
            - 두가지 방법
            
            ```python
            # project/settings.py
            TEMPLATES = [
                {   ...
                   # **"DIRS": [BASE_DIR / 'product_project/templates'],
            			'DIRS': [
            			            os.path.join(BASE_DIR, 'product_project', 'templates'),
            			        ],**
            ```
            
- 3.index.html 작성
    
    ```html
    <!-- app/index.html-->
    {% extends 'base.html' %}
    {% block content %}   
        <h2>index 페이지</h2>
    
        상품 정보 제공 사이트 <br>
        홈입니다 
    {% endblock content %}
    ```
    
- 4.CSS 적용
    - 최상위 폴더에 static 폴더 생성
    - css 폴더 생성
        - **product.css 생성**
    
    ![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled.png)
    
    - settings.py
        - 🔥 **STATICFILES_DIRS 설정**
        - 프로젝트 폴더 안에 설정했기 때문에, 한 뎁스 들어가서 static
    
    ```python
    # settings.py
    STATIC_URL = '/static/'
    
    STATICFILES_DIRS = [
        # BASE_DIR / 'product_project/static' 이렇게 해도된다.
         os.path.join(BASE_DIR, **'product_project',** 'static')
    ]
    ```
    
- 5.모델 생성 / MySQL 로 DB 변경
    1. **mysqlclient 패키지 설치**
        
        `pip install mysqlclient`
        
    
    ### 2.**MySQL 워크벤치 작업**
    
    - DB 생성
    - sql문 실행
    
    ```sql
    ALTER TABLE product MODIFY prd_no VARCHAR(10) NOT NULL,
                        MODIFY prd_name VARCHAR(20),
                        MODIFY prd_maker VARCHAR(30),
                        MODIFY prd_color VARCHAR(10);
                        
    -- prdNo에 기본키 제약조건 추가
    ALTER TABLE product ADD PRIMARY KEY (prd_no);
    ```
    
    - Table 생성
    
    - [MACOS] CSV파일 - 테이블 IMPORT 시 MAC 인코딩 문제 (CSV)
        - CSV 파일 불가능 JSON으로 변환해서 올려야함!
        - [https://csvjson.com/csv2json](https://csvjson.com/csv2json)
    
    ### 3.**db_settings.py 생성**
    
    - manage.py 위치에 생성
    - DB 연결 정보 입력
    
    ```python
    # db_settings.py
    DATABASES = {
        "default": {
            "ENGINE": "django.db.backends.mysql",  # 엔진
            "NAME": "django_db",  # 데이터베이스 이름
            "USER": "root",  # 사용자
            "PASSWORD": "",  # 비밀번호
            "HOST": "localhost",  # 호스트
            "PORT": "3306",  # 포트번호
        }
    }
    
    # SECRET_KEY
    # settings.py에서 복사하고
    # Settings.py의 SECRET_KEY는 주석처리
    SECRET_KEY = ""
    ```
    
    ### 4.**settings.py에서 db 설정 변경**
    
    - db_settings Import하고
    - DATABASE 부분 주석처리
    - SECRETE_KEY 주석처리
    - db_settings 것 사용한다고 설정
    
    ```python
    # project/settings.py
    from pathlib import Path
    import db_settings
    
    # DATABASES = {
    #     "default": {
    #         "ENGINE": "django.db.backends.sqlite3",
    #         'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    #     }
    # }
    DATABASES = db_settings.DATABASES
    SECRET_KEY = db_settings.SECRET_KEY
    ```
    
    ### 5.**모델 생성**
    
    `python manage.py inspectdb` 명령어
    
    - 터미널에 출력된 product 클래스 복사해서
    - app의 models.py에 붙여 넣기

    
    [https://lh4.googleusercontent.com/fmHhMVfE3DLkeN14o2jkWx4lb1wFHhZ2BvO6aY1jWzMVnaJM1ZVnhc713RKEutc9K5NS0zckRjFM4p4oPXFzZATSsgHGpwvR6itrEPAZcyg0EPs6V9QBN-WpJJNjVxeOmTxLkCQpt7y9](https://lh4.googleusercontent.com/fmHhMVfE3DLkeN14o2jkWx4lb1wFHhZ2BvO6aY1jWzMVnaJM1ZVnhc713RKEutc9K5NS0zckRjFM4p4oPXFzZATSsgHGpwvR6itrEPAZcyg0EPs6V9QBN-WpJJNjVxeOmTxLkCQpt7y9)
    
    - 마이그레이션!
    

# **CRUD 기능 구현**

---

## 상품 전체 조회 페이지 생성

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%201.png)

1. Templates : product_list.html 생성 (products 를 받아서 보여줌)

```html
{% extends 'base.html' %}
{% block content %}
<h2>상품 정보 조회</h2>
<table id="prd_list">
    <tr>
        <th>상품번호</th>
        <th>상품명</th>
        <th>가격</th>
        <th>제조회사</th>
        <th>색상</th>
        <th>카테고리번호</th>
        <th>수정</th>
        <th>삭제</th>
    </tr>
    {% for prd in products %}
    <tr>
        <td>{{ prd.prd_no }}</td>
        <td>{{ prd.prd_name }}</td>
        <td>{{ prd.prd_price }}</td>
        <td>{{ prd.prd_maker}}</td>
        <td>{{ prd.prd_color }}</td>
        <td>{{ prd.ctgno }}</td>
        <td>수정</td>
        <td>삭제</td>
    </tr>
    {% endfor %}
</table>
{% endblock content%}
```

1. views.py에 추가
- products 반환해야함(템플릿에서 보여줘야하니까)
- objects.all() 사용

```python
# app/views.py
from .models import Product

def product_list(request):
    # DB에서 select한 결과 반환(모든 상품 데이터 반환)
    # objects.all()사용
    products = Product.objects.all()
    return render(request, 'product_app/product_list.html',{'products':products})
```

1. urls.py에 추가

```python
from django.urls import path
from . import views

urlpatterns = [
    path('product/list/', views.product_list, name='product_list'),
```

- nvbar.html에 링크에 추가

```html
<li><a href="{% url 'index' %}">HOME</a></li>
```

- 결과 확인
- CSS 적용 후 결과 확인 : product.css에 추가

- 템플릿을 못읽어옴 : contents
    
    template에서 {% block contents %}하면 안된다. s제거
    

- **천단위 구분기호 표시 : humanize**
    - **product_list : 전체 상품 조회에서 숫자에 천단위 구분기호 표시**
    - `pip install humanize`
    - **프로젝트의 settings.py의 INSTALLED_APPS에 추가**
        
        ```python
        **django.contrib.humanize**
        ```
        
        - **출력 페이지에서 {% load humanize %}**
        - **출력되는 숫자(변수에 필터 적용)**
            - **{{ 변수|intcomma}**
        
        ```html
        <td>{{ prd.prd_price**|intcomma** }}</td>
        ```
        
    
    ![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%202.png)
    

## 상품 상세 조회

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%203.png)

- product_detail.html 생성

```html
{% extends 'base.html' %}
{% block content %}   
    <h2>상품 상세 조회</h2>
    <table id="prd_detail">
        <tr><th>상품번호</th><td>{{ product.prd_no }}</td></tr>
        <tr><th>상품명</th><td>{{ product.prd_name }}</td></tr>
        <tr><th>가격</th><td>{{ product.prd_price }}</td></tr>
        <tr><th>제조회사</th><td>{{ product.prd_maker }}</td></tr>
        <tr><th>색상</th><td>{{ product.prd_color }}</td></tr>
        <tr><th>카테고리번호</th><td>{{ product.ctg_no }}</td></tr>
    </table>
{% endblock content %}
```

- views.py에 추가
    - **전달받은 prd_no에 해당되는 상품 검색해서 반환**
    - get_object_or_404()
    - pk로 찝어서 해당 상품 특정하기

```python
# app/views.py
# 상세 상품 조회
# 전달받은 prd_no에 해당되는 1개 상품 데이터 반환
def product_detail(request, prd_no):
    # prd_no 조건에 맞는 행 SELect
    # get_object_or_404() 사용
    product = get_object_or_404(Product, pk = prd_no)
    return render(request, 'product_app/product_detail.html',{'product':product})
```

- urls.py에 추가
    - 매개변수로 prd_no 넘겨주기

```python
# app/urls.py
urlpatterns = [ ...
    # 매개변수 : prd_no(pk)
    path('product/detail/<str:prd_no>/', views.product_detail, name='product_detail'),
]
```

- product_list.html의 상품번호 값에 링크 추가
    - **prd_no 전달**

```html
<td><a href="{% url 'product_list' prd.prd_no %}">{{ prd.prd_no }}</a></td>
<!-- 아래 오류난다.-->
~~<td><a href="{% url 'product_list' **pk=prd.prd_no** %}">{{ prd.prd_no }}</a></td>~~
```

- 오류 2: NoReverseMatch at /product/list/ **Reverse for ' ' with arguments ' ' not found. 1 pattern(s) tried: ['(?P<**  
`<a href="{% url 'product_list' **pk=prd.prd_no** %}">`
    - Pk를 넘겨줄때 pk= 로 쓰면 오류난다…
    
    ```html
    <td><a href="{% url 'product_list' prd.prd_no %}">{{ prd.prd_no }}</a></td>
    ```
    
    ![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%204.png)
    
- 결과 확인
- CSS 적용 후 결과 확인

- 오류 : NoReverseMatch at /product/list/ **Reverse for ' ' with arguments ' ' not found. 1 pattern(s) tried: ['(?P<**
    - 링크를 걸었더니 오류가 났다. 나머지 데이터는 잘 받아오는데..!
    
    ```html
    <td><a href="**{% url 'product_list' prd.prd_no %}**">{{ prd.prd_no }}</a></td>
    ```
    
    ![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%205.png)
    
    - 원인
    
    - url보면 detail에서 pk매개변수를 받는다. product/list 에서는 매개변수 못 넘겨준다… 그래서 오류났던것
    
    ```python
    # app/urls.py
    urlpatterns = [
        path('product/list/', views.product_list, name='product_list'),
        path('product/detail/<str:prd_no>/', views.product_detail, name='product_detail'),
    ]
    ```
    
    - solution
    
    ```html
    # navbar.html
    <td><a href="{% url 'product_detail' prd.prd_no %}">{{ prd.prd_no }}</a></td>
    ```
    

## **상품 등록**

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%206.png)

- forms.py
    - product_app안에 forms.py 생성
    - forms 라이브러리의 ModelForm 클래스 상속 받음
    - 정의한 폼 클래스 Meta 클래스를 선언
    - ModelForm
        - 모델과 연결
        - 지정된 모델로부터 필드 정보를 읽어와서
        - 자동으로 폼 필드를 세팅
    
    ```python
    # app/forms.py
    from django import forms
    from .models import Product
    
    class ProductForm(forms.ModelForm):
        class Meta:
            model = Product
            fields = (
                'prd_no',
                'prd_name',
                'prd_price',
                'prd_maker',
                'prd_color',
                'ctg_no'
            )
    ```
    
- product_form.html 생성 : 입력 폼

```html
<!-- app/templates/product_form.html-->
{% extends 'base.html' %}

{% block content %}   
    <h2>도서 등록</h2>

    <form method="post">
        {% csrf_token %}
        <table id="form_tbl">
            {{ form }}
        </table><br>
        <button id='form_btn' type="submit">등록</button>
    </form>

{% endblock content %}
```

- views.py에 추가 : form.save()
    - 보통 이 흐름대로 작성하므로 기억해둘것
    - 폼 유효성 검사 : 중복된 데이터가 있나 확인

```python
# app/views.py
from django.shortcuts import get_object_or_404, redirect, render
# 상품 등록
def product_insert(request):

    # (1)요청이 POST인지 확인하고
    if request.method == 'POST':

        # (2) form data의 내용 폼 변수에 저장
        form = ProductForm(request.POST)

        # (3) django 기본기능인 is_valid() 사용해서 데이터 유효성 확인
        if form.is_valid():

            # (4) form에 저장된 데이터를 아직 완전 저장하지 않고, 다른 작업이 있을 경우 (임시로)
            product = form.save(commit=False)
            # (5) 🔥 사용자가 입력한 데이터 지금 DB에 완전 저장
            product.save()

            # (6) DB에 저장 후 결과 확인하기 위해 상품조회 화면으로 이동 (forwarding)
            return redirect('product_list')
    else:
        # 빈 폼 객체 만들기
        form = ProductForm()

    # (7) else POST요청이 아니라면 입력 폼 그대로 출력(빈 폼 다시 보여주기)
    return render(request,'product_app/product_form.html',{'form':form})
```

- **urls.py에 추가**

```python
# app/urls.py
urlpatterns = [
       path('product/insert/', views.product_insert, name='product_insert'),
]
```

- **nvbar.html에 링크 추가**

```html
<li><a href="{% url 'product_insert' %}">상품 등록</a></li>
```

- **결과 확인 (디폴트로 생성된 폼 확인)**
    - 새로운 상품 등록 성공
    - 현재 등록 후 메인 페이지로 넘어가는데, 전체 조회 페이지가 지금오류남

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%207.png)

- 유효성 검사가 이미 있는 제품을 등록시 막아준다.

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%208.png)

- **레이블 변경 작업 수행 : 결과 확인**
    - dictionary형태로 레이블 추가

```python
# app/forms.py
class ProductForm(forms.ModelForm):
    class Meta:
        model = Product
        fields = [
            'prd_no',
            'prd_name',
            'prd_price',
            'prd_maker',
            'prd_color',
            'ctg_no'
        ]
        labels = {
            'prd_no': '상품번호',
            'prd_name':'상품명',
            'prd_price':'상품가격',
            'prd_maker':'제조회사',
            'prd_color':'색상',
            'ctg_no':'카테고리'
        }
```

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%209.png)

- **CSS 적용 : 결과 확인**

- **상품 데이터 저장되는지 확인**
- 

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%2010.png)

## 상품 정보 수정

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%2011.png)

- **상품 등록에 사용했던 ProductForm 그대로 사용 (form은 안만들어도 된다.)**
- **product_update.html생성**
    - product_form.html 그대로


- **views.py 수정된 데이터 저장**

```python
# app/views.py
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
    # (8) else: POST이 아닐 경우 입력 폼 그대로 출력
    return render(request, 'product_app/product_update.html', {'form':form})
```

- **urls.py에 추가**
    - **폼 보여줄 때 prd_no에 해당되는 데이터가 폼 태그에 출력**

```python
# app/urls.py
# 상품수정
path('product/update/<str:prd_no>/', views.product_update, name='product_update'),
```

- **product_list.html에 [수정]에 링크 추가 : prd_no 전달**

```html
<!--app/templates/product_list.html-->
<td><a href="{% url 'product_update' prd.prd_no %}">수정</a></td>
```

## 상품 정보 삭제

![Untitled](MySQL%20%E1%84%8B%E1%85%A7%E1%86%AB%E1%84%83%E1%85%A9%E1%86%BC%20CRUD%E1%84%80%E1%85%AE%E1%84%92%E1%85%A7%E1%86%AB%20ab6b3f3007c04400924d069f41b5737e/Untitled%2012.png)

- product_list에서  [삭제]를 클릭하면
    - ‘삭제하시겠습니까’ Confirm() 출력후
    - [확인] 버튼 누리면 삭제

---

- **views.py**

```python
# app/views.py
# 상품 삭제
def product_delete(request, prd_no):
    # prd_no에 해당되는 상품 찾아와서
    product = get_object_or_404(Product, pk=prd_no)

    # 상품 데이터 삭제
    product.delete()

    # 상품 조회 화면으로 이동
    return redirect('product_list')
```

- **urls**

```python
# app/urls.py
# 상품 삭제
path('product/delete/<str:prd_no>/', views.product_delete, name='product_delete'),
```

- **[삭제] 버튼에 이벤트 처리 (js)**
    
    ```html
    <!--app/templates/product_list-->
    <a href="{% url 'product_delete' prd.prd_no %}"
                    onclick="return confirm('삭제하시겠습니까?')">
                <button class="btn">삭제</button></a>
    ```
    
