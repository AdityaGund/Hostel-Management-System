# urls.py
from django.urls import path
from .views import generate_pdf, send_roommate_request, roommate_requests

urlpatterns = [
    path('generate-pdf/', generate_pdf, name='generate_pdf'),
    path('send_request/', send_roommate_request, name='send_roommate_request'),
    path('roommate_requests/', roommate_requests, name='roommate_requests'),
]
