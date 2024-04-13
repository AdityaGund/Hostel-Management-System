from django.urls import path
from .views import *

urlpatterns = [
    path('maintenance_request/', maintenance_request, name='maintenance_request'),
    path('studentrole_index/', studentrole_index, name='studentrole_index'),
    path('bonafied-request/', bonafied_request, name='bonafied_request'),
    path('bonafied-request-list/', bonafied_request_list, name='bonafied_request_list'),
    path('download-bonafied-certificate/<int:pk>/', download_bonafied_certificate, name='download_bonafied_certificate'),
]
