from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.mail import send_mail
from .forms import EmailVerificationForm, OTPVerificationForm
from registration.models import *
import random
from django.http import HttpResponse

def update_verified_status(application_id):
    models_to_check = [CivilEngineering, ElectricalEngineering, ComputerEngineering, InstrumentationEngineering, ManfacturingEngineering, MechanicalEngineering]

    for model in models_to_check:
        try:
            student = model.objects.get(application_id=application_id)
            student.verified = True
            student.save()
        except model.DoesNotExist:
            pass

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
                request.session['application_id'] = application_id
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
                application_id = request.session.get('application_id')
                update_verified_status(application_id)
                return HttpResponse("success")
            else:
                messages.error(request, 'Invalid OTP. Please try again.')
    else:
        form = OTPVerificationForm()

    return render(request, 'otp_verification.html', {'form': form})

def select_students(request):
    selected_students = []

    mech_students = MechanicalEngineering.objects.filter(verified=True).order_by('rank')[:20]
    selected_students.extend(mech_students)

    comp_students = ComputerEngineering.objects.filter(verified=True).order_by('rank')[:20]
    selected_students.extend(comp_students)

    other_students = []
    branches = [CivilEngineering, ElectricalEngineering, InstrumentationEngineering, ManfacturingEngineering]

    for branch in branches:
        branch_students = branch.objects.filter(verified=True).order_by('rank')[:10]
        other_students.extend(branch_students)

    selected_students.extend(other_students)

    remaining_seats = 80 - len(selected_students)

    if remaining_seats > 0:
        top_verified_students = (CivilEngineering.objects.filter(verified=True) +
                                 ElectricalEngineering.objects.filter(verified=True) +
                                 InstrumentationEngineering.objects.filter(verified=True) +
                                 ManfacturingEngineering.objects.filter(verified=True)).order_by('rank')[:remaining_seats]

        selected_students.extend(top_verified_students)
    
    for student in selected_students:
            student.selected = True
            student.save()