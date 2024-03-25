from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.contrib.auth.password_validation import validate_password
from django.contrib import messages
from django.shortcuts import render
from datetime import datetime, timedelta
from django.utils import timezone
import pytz
from .models import *
from .forms import OTPVerificationForm
from django.core.mail import send_mail
import random
from django.apps import apps

@login_required(login_url='login')
def HomePage(request):
    deadline = datetime(2024, 3, 15, 19, 10, 0, tzinfo=pytz.timezone('Asia/Kolkata'))  # March 6, 2024, 19:00 IST
    # Get the current time in the same timezone as the deadline
    current_time = timezone.now()

    # Calculate remaining time
    remaining_time = (deadline - current_time).total_seconds()  # Convert timedelta to seconds

    return render(request, 'home.html', {'remaining_time': remaining_time})


def LandingPage(request):
    return render(request,'landing.html')

def send_verification_email(email, verification_code):
    subject = 'Verification Code'
    message = f'Your verification code is: {verification_code}'
    from_email = 'djangoproject24@gmail.com'
    recipient_list = [email]
    send_mail(subject, message, from_email, recipient_list)

def SignupPage(request):
    if request.method == 'POST':
        if all(field in request.POST for field in ['username', 'email', 'password1', 'password2', 'branch']):
            username = request.POST['username']
            email = request.POST['email']
            password = request.POST['password1']
            re_password = request.POST['password2']
            branch = request.POST['branch']

            if not (username and email and password and re_password and branch):
                messages.error(request, "All fields are required!")
                return redirect('signup')  

            if password != re_password:
                messages.error(request, "Passwords do not match!")
                return redirect('signup')  

            branch_model = None
            if branch == 'CivilEngineering':
                branch_model = CivilEngineering
            elif branch == 'ElectricalEngineering':
                branch_model = ElectricalEngineering
            elif branch == 'ComputerEngineering':
                branch_model = ComputerEngineering
            elif branch == 'InstrumentationEngineering':
                branch_model = InstrumentationEngineering
            elif branch == 'ManfacturingEngineering':
                branch_model = ManfacturingEngineering
            elif branch == 'MechanicalEngineering':
                branch_model = MechanicalEngineering

            if branch_model is None:
                messages.error(request, "Invalid branch selection!")
                return redirect('signup')

            if branch_model.objects.filter(application_id=username, email=email).exists():
                verification_code = ''.join(random.choices('0123456789', k=6))
                request.session['verification_code'] = verification_code
                request.session['email'] = email
                request.session['application_id'] = username
                request.session['password'] = password
                request.session['branch'] = branch_model.__name__
                send_verification_email(email, verification_code)
                messages.success(request, 'OTP sent successfully. Check your email.')
                return redirect('verify_otp')
            else:
                messages.error(request, "student details doesn't match with database")
                return redirect('signup')

        else:
            messages.error(request, "All fields are required!")
            return redirect('signup')
    else:
        return render(request, 'signup.html')
    

def verify_otp(request):
    if request.method == 'POST':
        form = OTPVerificationForm(request.POST)
        if form.is_valid():
            entered_otp = form.cleaned_data['otp']
            stored_otp = request.session.get('verification_code')
           
            email = request.session.get('email')
            password = request.session.get('password')
            if entered_otp == stored_otp:
                messages.success(request, 'Verification successful. Your can login now.')
                application_id = request.session.get('application_id')
                branch_model_name = request.session.get('branch')
                branch_model = apps.get_model('registration', branch_model_name)
                student = branch_model.objects.get(application_id=application_id)
                student.verified = True
                new_user = User.objects.create_user(username=application_id, email=email, password=password)
                new_user.save()
                student.user = new_user
                student.save()
                return redirect('login')
            else:
                messages.error(request, 'Invalid OTP. Please try again.')
    else:
        form = OTPVerificationForm()

    return render(request, 'otp_verification.html', {'form': form})

def LoginPage(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('pass')
        if not (username and password):
                messages.error(request, "All fields are required!")
                return redirect('login')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, "invalid credentials!")
            return redirect('login')
    return render(request, 'login.html')

def LogoutPage(request):
    logout(request)
    return redirect('login')