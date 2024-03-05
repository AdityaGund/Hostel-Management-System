from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.mail import send_mail
from .forms import EmailVerificationForm, OTPVerificationForm
from registration.models import *
import random
from django.http import HttpResponse

def get_email_from_application_id(application_id):
    models_to_check = [CivilEngineering, ElectricalEngineering, ComputerEngineering, InstrumentationEngineering, ManfacturingEngineering, MechanicalEngineering]

    for model in models_to_check:
        try:
            student = model.objects.get(application_id=application_id)
            email = student.email
            return email
        except model.DoesNotExist:
            pass
    return None

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
            application_id = form.cleaned_data['application_id']
            email = get_email_from_application_id(application_id)
            if email is not None:
                verification_code = ''.join(random.choices('0123456789', k=6))
                request.session['verification_code'] = verification_code
                request.session['email'] = email
                send_verification_email(email, verification_code)
                messages.success(request, 'OTP sent successfully. Check your email.')
                return redirect('verify_otp')
            else:
                messages.error(request, 'User with the provided Application ID does not exist. Please try again.')
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
                return HttpResponse("success")
            else:
                messages.error(request, 'Invalid OTP. Please try again.')
    else:
        form = OTPVerificationForm()

    return render(request, 'otp_verification.html', {'form': form})