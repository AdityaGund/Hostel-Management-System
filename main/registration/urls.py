from django.urls import path
from . import views
urlpatterns = [
    path('login/', views.LoginPage, name='login'),
    path('signup/', views.SignupPage, name='signup'),
    path('home/', views.HomePage, name='home'),
    path('logout/', views.LogoutPage, name='logout'),
    path('',views.LandingPage,name="landing"),
]