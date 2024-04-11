# urls.py
from django.urls import path
from .views import *

urlpatterns = [
    path('generate-pdf/', generate_pdf, name='generate_pdf'),
    path('send_request/', send_roommate_request, name='send_roommate_request'),
    path('student-list/',student_list, name='student_list'),
    path('roommate_requests/', roommate_requests, name='roommate_requests'),
    path('studentHome/', studentHome, name="studentHome"),
    path('room_preferences/', room_preferences, name="room_preferences"),
]
