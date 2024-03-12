# urls.py
from django.urls import path
from .views import send_otp, verify_otp,generate_pdf

urlpatterns = [
    # Other URL patterns
    path('send_otp/', send_otp, name='send_otp'),
    path('verify_otp/', verify_otp, name='verify_otp'),
    path('generate-pdf/', generate_pdf, name='generate_pdf'),
]
