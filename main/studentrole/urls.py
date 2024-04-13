from django.urls import path
from .views import *

urlpatterns = [
    path('maintenance_request/', maintenance_request, name='maintenance_request'),
    path('studentrole_index/', studentrole_index, name='studentrole_index')
]