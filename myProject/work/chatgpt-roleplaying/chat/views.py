# chat/views.py

from django.contrib import messages
from django.contrib.admin.views.decorators import staff_member_required
# from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils.decorators import method_decorator
from django.urls import reverse_lazy
from django.views.generic import CreateView, UpdateView, ListView, DetailView, DeleteView

from chat.forms import RolePlayingRoomForm
from chat.models import RolePlayingRoom

# 채팅방 생성뷰
# 아직 로그인 기능을 구현하지 않았기에, login_required 대신 admin 앱의 로그인 기능을 활용토록 합니다.
@method_decorator(staff_member_required, name="dispatch")
class RolePlayingRoomCreateView(CreateView):
    model = RolePlayingRoom
    form_class = RolePlayingRoomForm
    # success_url = reverse_lazy("role_playing_room_new")  # 페이지 성공 후에 이동할 페이지 주소 지정

    def form_valid(self, form):
        role_playing_room = form.save(commit=False)
        role_playing_room.user = self.request.user
        response = super().form_valid(form)
        messages.success(self.request, "새로운 채팅방을 생성했습니다.")
        return response


role_playing_room_new = RolePlayingRoomCreateView.as_view()


# 수정뷰
@method_decorator(staff_member_required, name="dispatch")
class RolePlayingRoomUpdateView(UpdateView):
    model = RolePlayingRoom
    form_class = RolePlayingRoomForm
    # success_url = reverse_lazy("role_playing_room_new")

    def get_queryset(self):
        qs = super().get_queryset()
        qs = qs.filter(user=self.request.user)
        return qs

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, "채팅방을 수정했습니다.")
        return response


role_playing_room_edit = RolePlayingRoomUpdateView.as_view()

# 전체 조회 뷰
@method_decorator(staff_member_required, name="dispatch")
class RolePlayingRoomListView(ListView):
    model = RolePlayingRoom

    def get_queryset(self):
        qs = super().get_queryset()
        qs = qs.filter(user=self.request.user)
        return qs


role_playing_room_list = RolePlayingRoomListView.as_view()


# 개별 채팅방 상세 조회 뷰
@method_decorator(staff_member_required, name="dispatch")
class RolePlayingRoomDetailView(DetailView):
    model = RolePlayingRoom

    def get_queryset(self):
        qs = super().get_queryset()
        qs = qs.filter(user=self.request.user)
        return qs


role_playing_room_detail = RolePlayingRoomDetailView.as_view()


# 채팅방 삭제 뷰
@method_decorator(staff_member_required, name="dispatch")
class RolePlayingRoomDeleteView(DeleteView):
    model = RolePlayingRoom
    success_url = reverse_lazy("role_playing_room_list")

    def get_queryset(self):
        qs = super().get_queryset()
        qs = qs.filter(user=self.request.user)
        return qs

    def form_valid(self, form):
        response = super().form_valid(form)
        messages.success(self.request, "채팅방을 삭제했습니다.")
        return response


role_playing_room_delete = RolePlayingRoomDeleteView.as_view()

# 채팅 메세지 저장 뷰
# def save_message(request):
#     if request.method == "POST":
