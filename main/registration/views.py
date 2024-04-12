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
# from registration.models import CheckInOut
from django.utils import timezone
from datetime import datetime, timedelta
from django.utils import timezone
import pytz
from .models import *
from .forms import OTPVerificationForm
from django.core.mail import send_mail
import random
from django.apps import apps
from registration.models import FirstYear,SecondYear,ThirdYear,FinalYear
from django.http import JsonResponse
from .models import SelectedDates
from django.views.decorators.http import require_POST
from .models import SelectedDates
from adminrole.views import *


def HomePage(request):
    selected_dates=SelectedDates.objects.latest('id')

    deadlinedate=str(selected_dates.selected_students_list)
    year=int(deadlinedate.split('-')[0])
    month=int(deadlinedate.split('-')[1])
    date=int(deadlinedate[-2:])
    final_alllotment_date=str(selected_dates.final_room_allotment)
    year2=int(final_alllotment_date.split('-')[0])
    month2=int(final_alllotment_date.split('-')[1])
    date2=int(final_alllotment_date[-2:])

    year2=int(final_alllotment_date.split('-')[0])
    month2=int(final_alllotment_date.split('-')[1])
    date2=int(final_alllotment_date[-2:])

    reg_start_date=str(selected_dates.registration_period.split(' ')[0])
    reg_end_date=str(selected_dates.registration_period.split(' ')[-1])
    pref_start_date=str(selected_dates.preference_selection_date.split(' ')[0])
    pref_end_date=str(selected_dates.preference_selection_date.split(' ')[-1])
    verf_start_date=str(selected_dates.verification_period.split(' ')[0])
    verf_end_date=str(selected_dates.verification_period.split(' ')[-1])

    deadline = datetime(year, month, date, 12, 23, 0, tzinfo=pytz.timezone('Asia/Kolkata'))  # March 6, 2024, 19:00 IST
 # Get the current time in the same timezone as the deadline

    deadline2=datetime(year2,month2,date2,12,0,0,tzinfo=pytz.timezone('Asia/Kolkata'))

    
    current_time = timezone.now()

    remaining_time = (deadline - current_time).total_seconds()  # Convert timedelta to seconds


    remaining_time2=(deadline2-current_time).total_seconds()




    return render(request, 'home.html', {'remaining_time': remaining_time,'remaining_time2':remaining_time2,'reg_start_date':reg_start_date,'reg_end_date':reg_end_date,'deadline':deadlinedate,'pref_start_date':pref_start_date,'pref_end_date':pref_end_date,'final_allotment':final_alllotment_date,'verf_start_date':verf_start_date,'verf_end_date':verf_end_date})


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
            elif user.groups.filter(name='Amenity').exists():
                login(request, user)
                return redirect('coepMess')
            else:
                latest_selected_date = SelectedDates.objects.latest('id')
                final_date = latest_selected_date.final_room_allotment
                if final_date:
                    final_room_allotment_str = str(final_date)
                    final_date = timezone.make_aware(datetime.strptime(final_room_allotment_str, '%Y-%m-%d'))
                year_model = None
                for model in [FirstYear, SecondYear, ThirdYear, FinalYear]:
                    student_query = model.objects.filter(application_id=username)
                    if student_query.exists():
                        year_model = model
                        student_found = True
                        break
                if not student_found:
                    return HttpResponse("Student not found")
                if year_model.objects.filter(application_id=username, selected=True):
                    if(timezone.now()>=final_date):
                        login(request, user)
                        return redirect('maintenance_request')
                    else:
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



def admin_selected_dates(request):
    if request.method == 'POST':
        reg_start_date = request.POST.get('registrationStartDate')
        reg_end_date = request.POST.get('registrationEndDate')
        reg_period = f'{reg_start_date} to {reg_end_date}'

        verf_start_date = request.POST.get('offlineverificationStartDate')
        verf_end_date = request.POST.get('offlineverificationEndDate')
        verf_period = f'{verf_start_date} to {verf_end_date}'
        pdf_date = request.POST.get('pdfgenerationdate')

        pref_start_date = request.POST.get('roommakingprocessStartDate')
        pref_end_date = request.POST.get('roommakingprocessEndDate')
        final_result_date = request.POST.get('finalresultdeclaration')

        selected_dates = SelectedDates.objects.create(
            registration_period=reg_period,
            selected_students_list=pdf_date,
            preference_selection_date=f'{pref_start_date} to {pref_end_date}',
            final_room_allotment=final_result_date,
            verification_period=verf_period,
        )

        response_data = {
            'Registration': selected_dates.registration_period,
            'Selected Students List': selected_dates.selected_students_list,
            'Preference Selection Date': selected_dates.preference_selection_date,
            'Final Room Allotment': selected_dates.final_room_allotment,
            'Offline Verification':selected_dates.verification_period,
            'message': 'Selected dates saved successfully'
        }
        return JsonResponse(response_data)
    else:
        try:
            selected_dates = SelectedDates.objects.latest('id')
            response_data = {
                'Registration': selected_dates.registration_period,
                'Selected Students List': selected_dates.selected_students_list,
                'Preference Selection Date': selected_dates.preference_selection_date,
                'Final Room Allotment': selected_dates.final_room_allotment,
                'Offline Verification':selected_dates.verification_period,
            }
            return JsonResponse(response_data)
        except SelectedDates.DoesNotExist:
            return JsonResponse({})
        
@require_POST
@login_required
def remove_admin(request):
    user_id = request.POST.get('user_id')

    try:
        user = User.objects.get(id=user_id)
        user.delete()
        return JsonResponse({'success': True})
    except User.DoesNotExist:
        return JsonResponse({'success': False, 'error': 'User not found'})

