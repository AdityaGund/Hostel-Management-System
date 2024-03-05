from django import forms

class EmailVerificationForm(forms.Form):
    application_id = forms.CharField(label='Application ID', max_length=10)

class OTPVerificationForm(forms.Form):
    otp = forms.CharField(label='OTP', max_length=6)
