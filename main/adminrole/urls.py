from django.urls import path, re_path
from .views import *
from django.views.static import serve
from django.conf import settings

urlpatterns = [
    path('maintenance/', maintenance, name='maintenance'),
    path('guest_booking/', guest_booking, name='guest_booking'),
    path('adminHome/', admin_home, name='admin_home'),
    path('checkinout/', checkinout, name='checkinout'),
    path('add_notice/', notice_create, name='add_notice'),
    path('entries/', show_entries, name='show_entries'),
    path('approve_bonafied_request/', bonafied_request_list, name='approve_bonafied_request'),
    path('approve-bonafied-request/<int:pk>/', approve_bonafied_request, name='approve_bonafied_request'),
    path('reject-bonafied-request/<int:pk>/', reject_bonafied_request, name='reject_bonafied_request'),
    re_path(r'^guest_booking/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    path('checkoutstudents/',checkoutstudents,name='checkoutstudents'),
    path('securityHome/',security_home,name='security_home'),
    path('roomdetails/',roomdetails,name='roomdetails'),
]