from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.mail import send_mail
from .forms import EmailVerificationForm, OTPVerificationForm
from .models import Application
import random
from django.http import HttpResponse

def send_verification_email(email, verification_code):
    subject = 'Verification Code'
    message = f'Your verification code is: {verification_code}'
    from_email = 'djangoproject24@gmail.com'
    recipient_list = [email]
    send_mail(subject, message, from_email, recipient_list)

def send_otp(request):
    if request.method == 'POST':
        form = EmailVerificationForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            verification_code = ''.join(random.choices('0123456789', k=6))
            request.session['verification_code'] = verification_code
            request.session['email'] = email
            send_verification_email(email, verification_code)
            messages.success(request, 'OTP sent successfully. Check your email.')
            return redirect('send_otp')  # Redirect to the same page for OTP entry
    else:
        form = EmailVerificationForm()

    return render(request, 'email_verification.html', {'form': form})


def verify_otp(request):
    if request.method == 'POST':
        form = OTPVerificationForm(request.POST)
        if form.is_valid():
            entered_otp = form.cleaned_data['otp']
            stored_otp = request.session.get('verification_code')
            email = request.session.get('email')
            if entered_otp == stored_otp:
                messages.success(request, 'Verification successful. Your email is verified.')
                # You can perform further actions here, e.g., update user profile, mark email as verified in the database.
                return redirect('success_page')  # Redirect to the success page.
            else:
                messages.error(request, 'Invalid OTP. Please try again.')
    else:
        form = OTPVerificationForm()

    return render(request, 'email_verification.html', {'form': form})