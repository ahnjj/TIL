# db_settings.py
DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.mysql",  # 엔진
        "NAME": "langmaster_testdb",  # 데이터베이스 이름
        "USER": "root",  # 사용자
        "PASSWORD": "wjd900105!",  # 비밀번호
        "HOST": "localhost",  # 호스트
        "PORT": "3306",  # 포트번호
    }
}


# SECRET_KEY
# settings.py에서 복사하고
# Settings.py의 SECRET_KEY는 주석처리
SECRET_KEY = "django-insecure-3faof68bj__27$1er)_z4f%dgd%mg3*d3=jcv*2f714ook67u&"
