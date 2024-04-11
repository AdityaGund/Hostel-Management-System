from django.urls import path
from .views import *

urlpatterns = [
    path('maintenance_request/', maintenance_request, name='maintenance_request')
]