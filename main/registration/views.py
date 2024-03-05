from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ValidationError
from django.core.validators import validate_email
from django.contrib.auth.password_validation import validate_password
from django.contrib import messages
from django.shortcuts import render

@login_required(login_url='login')
def HomePage(request):
    return render(request, 'home.html')

def LandingPage(request):
    return render(request,'landing.html')

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
            login(request, user)
            return redirect('home')
        else:
            messages.error(request, "invalid credentials!")
            return redirect('login')
    return render(request, 'login.html')

def LogoutPage(request):
    logout(request)
    return redirect('login')