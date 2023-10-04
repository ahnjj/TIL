import os
from channels.routing import ProtocolTypeRouter, URLRouter
from django.core.asgi import get_asgi_application
from channels.auth import AuthMiddlewareStack


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'mysite.settings')

django_asgi_app = get_asgi_application()    # Django project 초기화 이루어짐

import chat.routing     # app.routing 임포트는 여기다가 해야함 (noqa)

application = ProtocolTypeRouter({
    "http": django_asgi_app,        # http 요청은 이렇게
    "websocket": AuthMiddlewareStack(
        URLRouter(chat.routing.websocket_urlpatterns),     # websocket요청은 이렇게
        ),            
})