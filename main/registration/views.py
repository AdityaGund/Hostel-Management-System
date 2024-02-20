from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

@login_required(login_url='login')
def HomePage(request):
    return render(request, 'home.html')

def SignupPage(request):
    if request.method=='POST':
        username=request.POST.get('username')
        email=request.POST.get('email')
        password=request.POST.get('password1')
        re_password=request.POST.get('password2')
        if(password == re_password):
            new_user=User.objects.create_user(username, email, password)
            new_user.save()
            return redirect('login')
        else:
            return HttpResponse('passwords doesnt match!!')
        
    return render(request, 'signup.html')

def LoginPage(request):
    if request.method=='POST':
        username=request.POST.get('username')
        password=request.POST.get('pass')
        user=authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            return HttpResponse("invalid credentials")
    return render(request, 'login.html')

def LogoutPage(request):
    logout(request)
    return redirect('login')