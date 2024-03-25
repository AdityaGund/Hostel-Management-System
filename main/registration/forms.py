from django import forms

class OTPVerificationForm(forms.Form):
    otp = forms.CharField(label='OTP', max_length=6)