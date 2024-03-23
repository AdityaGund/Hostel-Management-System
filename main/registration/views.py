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


@login_required(login_url='login')
def HomePage(request):
    return render(request, 'home.html')

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
            try:
                validate_email(email)
            except ValidationError as e:
                messages.error(request, f"Invalid email: {e}")
                return redirect('superAdminHome')  
            try:
                validate_password(password)
            except ValidationError as e:
                messages.error(request, f"Weak password: {e}")
                return redirect('superAdminHome')  
            if not  4 <= len(username) <= 10:
                messages.error(request, "Username must be between 5 and 10 characters!")
                return redirect('superAdminHome')  
            if not username.strip():
                messages.error(request, "Username cannot be empty!")
                return redirect('superAdminHome')  
            if not email.strip():  
                messages.error(request, "Email cannot be empty!")
                return redirect('superAdminHome') 
            if not password.strip():
                messages.error(request, "Password cannot be empty!")
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

def SignupPage(request ):
    if request.method == 'POST':
        if all(field in request.POST for field in ['username', 'email', 'password1', 'password2']):
            username = request.POST['username']
            email = request.POST['email']
            password = request.POST['password1']
            re_password = request.POST['password2']
            if not (username and email and password and re_password):
                messages.error(request, "All fields are required!")
                return redirect('signup')  
            try:
                validate_email(email)
            except ValidationError as e:
                messages.error(request, f"Invalid email: {e}")
                return redirect('signup')  
            try:
                validate_password(password)
            except ValidationError as e:
                messages.error(request, f"Weak password: {e}")
                return redirect('signup')  
            if not  4 <= len(username) <= 10:
                messages.error(request, "Username must be between 5 and 10 characters!")
                return redirect('signup')  
            if not username.strip():
                messages.error(request, "Username cannot be empty!")
                return redirect('signup')  
            if not email.strip():  
                messages.error(request, "Email cannot be empty!")
                return redirect('signup') 
            if not password.strip():
                messages.error(request, "Password cannot be empty!")
                return redirect('signup')  

            if password != re_password:
                messages.error(request, "Passwords do not match!")
                return redirect('signup')  
            
            new_user = User.objects.create_user(username=username, email=email, password=password)
            admin_group = Group.objects.get(name='Student')
            admin_group.user_set.add(new_user)
            
            new_user.save()
            return redirect('login')
        else:
            messages.error(request, "All fields are required!")
            return redirect('signup')
    else:
        return render(request, 'signup.html')

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
                login(request, user)
                return redirect('home')
        else:
            messages.error(request, "invalid credentials!")
            return redirect('login')
    return render(request, 'login.html')

def LogoutPage(request):
    logout(request)
    return redirect('login')