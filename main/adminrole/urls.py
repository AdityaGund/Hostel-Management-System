from django.urls import path
from .views import *
from django.conf.urls import url
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    path('maintenance/', maintenance, name='maintenance'),
    path('guest_booking/', guest_booking, name='guest_booking'),
    url(r'^guest_booking/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    path('checkinout/', checkinout, name='checkinout')
]