from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.contrib.auth.password_validation import validate_password
from django.contrib import messages
from django.shortcuts import render
from django.contrib.auth.models import Group
from registration.models import CheckInOut
from django.utils import timezone
from datetime import datetime, timedelta
from django.utils import timezone
import pytz
from .models import *
from .forms import OTPVerificationForm
from django.core.mail import send_mail
import random
from django.apps import apps

def HomePage(request):
    deadline = datetime(2024, 3, 15, 19, 10, 0, tzinfo=pytz.timezone('Asia/Kolkata'))  # March 6, 2024, 19:00 IST
    # Get the current time in the same timezone as the deadline
    current_time = timezone.now()

    # Calculate remaining time
    remaining_time = (deadline - current_time).total_seconds()  # Convert timedelta to seconds

    return render(request, 'home.html', {'remaining_time': remaining_time})


def AdminHome(request):
    
    checkInusrs = CheckInOut.objects.all()
    context={"checkInusrs":checkInusrs}
    
        # if "increase_count" in request.POST:
    print("fdfd",request.POST)
        
    if request.method == 'POST':
        
        if "check_out_submit" in request.POST:  
            name = request.POST['name']
            mis = request.POST['mis']
            year = request.POST['year']
            reason = request.POST['reason']
            check_out_time = request.POST['check_out_time']
            obj=CheckInOut(student_name=name,mis=mis,year=year,reason=reason,check_out_time=check_out_time,check_in_time=check_out_time)
            obj.save()
            return redirect('adminHome')   
        
        
        # if not checkInusrs:
        #     message = f"No entry found for MIS {mis}"
        #     return render(request, 'my_template.html', {'message': message})
        # context = {'checkInusrs': checkInusrs}
        # return render(request, 'my_template.html', context)
        
        if "check_in_submit" in request.POST:
            mis=request.POST['mis']
            checkInusrs = CheckInOut.objects.filter(mis=mis).last()
            if not checkInusrs:
                message = f"No entry found for MIS {mis}"
                return render(request,"checkin.html",{'message': message})
            else:
                message = f"Checkout successful found for MIS {mis}"
                checkInusrs.check_out_time=timezone.now()
                checkInusrs.save()
                # context={"name":checkInusrs.student_name,"check_out_time":checkInusrs.check_out_time,"check_in_time":checkInusrs.check_in_time,"mis":checkInusrs.mis}
                return render(request,"checkin.html",{'message': message})
            
    return render(request, 'adminHome.html',context)

def SuperAdminHomePage(request):
    
    admin_group = Group.objects.get(name='Admin')
    admin_users = admin_group.user_set.all()
    
    context={
        "admin_users":admin_users
    }
    
    return render(request,'superAdminHomePage.html',context)

def AdminSignup(request):
    
    if request.method == 'POST':
        if all(field in request.POST for field in ['username', 'email', 'password1', 'password2']):
            username = request.POST['username']
            email = request.POST['email']
            password = request.POST['password1']
            re_password = request.POST['password2']
            
            
            if not (username and email and password and re_password):
                messages.error(request, "All fields are required!")
                return redirect('superAdminHome')  

            if password != re_password:
                messages.error(request, "Passwords do not match!")
                return redirect('superAdminHome')  
            
            new_user = User.objects.create_user(username=username, email=email, password=password)
            admin_group = Group.objects.get(name='Admin')
            admin_group.user_set.add(new_user)
            new_user.save()
            
            return redirect('superAdminHome')
        else:
            messages.error(request, "All fields are required!")
            return redirect('superAdminHome')
    else:
        return render(request, 'superAdminHomePage.html')
    

def Accommodation(request):
    return render(request, 'accommodation_landing.html')

def LandingPage(request):
    return render(request,'landing.html')

def Accommodation_reg(request):
    return render(request,'accommodation_reg.html')

def send_verification_email(email, verification_code):
    subject = 'Verification Code'
    message = f'Your verification code is: {verification_code}'
    from_email = 'djangoproject24@gmail.com'
    recipient_list = [email]
    send_mail(subject, message, from_email, recipient_list)

def SignupPage(request):
    if request.method == 'POST':
        if all(field in request.POST for field in ['username', 'email', 'password1', 'password2', 'branch', 'year']):
            username = request.POST['username']
            email = request.POST['email']
            password = request.POST['password1']
            re_password = request.POST['password2']
            branch = request.POST['branch']
            year = request.POST['year']

            if not (username and email and password and re_password and branch and year):
                messages.error(request, "All fields are required!")
                return redirect('signup')  

            if password != re_password:
                messages.error(request, "Passwords do not match!")
                return redirect('signup')  

            year_model = None
            if year == 'FirstYear':
                year_model = FirstYear
            elif year == 'SecondYear':
                year_model = SecondYear
            elif year == 'ThirdYear':
                year_model = ThirdYear
            elif year == 'FinalYear':
                year_model = FinalYear

            if year_model is None:
                messages.error(request, "Invalid year selection!")
                return redirect('signup')

            if year_model.objects.filter(application_id=username, email=email, branch=branch).exists():
                verification_code = ''.join(random.choices('0123456789', k=6))
                request.session['verification_code'] = verification_code
                request.session['email'] = email
                request.session['application_id'] = username
                request.session['password'] = password
                request.session['year'] = year_model.__name__
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
                year_model_name = request.session.get('year')
                year_model = apps.get_model('registration', year_model_name)
                student = year_model.objects.get(application_id=application_id)
                student.verified = True
                new_user = User.objects.create_user(username=application_id, email=email, password=password)
                admin_group = Group.objects.get(name='Student')
                admin_group.user_set.add(new_user)
                new_user.save()
                student.user = new_user
                student.save()
                return redirect('home')
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
            if user.is_superuser:
                login(request, user)
                return redirect('superAdminHome')
            
            elif user.groups.filter(name='Admin').exists():
                login(request, user)
                return redirect('adminHome')
            else:
                if FirstYear.objects.filter(application_id=username, selected=True):
                    login(request, user)
                    return redirect('studentHome')
                else:
                    messages.error(request, "invalid credentials!")
                    return redirect('login')
        else:
            messages.error(request, "invalid credentials!")
            return redirect('login')
    return render(request, 'login.html')

def LogoutPage(request):
    logout(request)
    return redirect('login')