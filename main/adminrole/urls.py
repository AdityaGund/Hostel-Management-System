from django.urls import path
from .views import *

urlpatterns = [
    path('maintenance/', maintenance, name='maintenance')
]