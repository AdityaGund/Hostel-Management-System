from django.urls import path, re_path
from .views import *
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    path('maintenance/', maintenance, name='maintenance'),
    path('guest_booking/', guest_booking, name='guest_booking'),
    path('adminHome/', admin_home, name='admin_home'),
    path('checkinout/', checkinout, name='checkinout'),
    path('create/', notice_create, name='notice_create'),
    re_path(r'^guest_booking/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),
]