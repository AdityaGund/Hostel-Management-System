# forms.py
from django import forms

class EmailVerificationForm(forms.Form):
    email = forms.EmailField(label='Email')

class OTPVerificationForm(forms.Form):
    otp = forms.CharField(label='OTP', max_length=6)
