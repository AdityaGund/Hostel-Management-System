from django.urls import path
from . import views
urlpatterns = [
    path('login/', views.LoginPage, name='login'),
    path('signup/', views.SignupPage, name='signup'),
    path('home/', views.HomePage, name='home'),
    path('adminHome/', views.AdminHome, name='adminHome'),
    path('superAdminHome/', views.SuperAdminHomePage, name='superAdminHome'),
    path('superAdminHome/signup/', views.AdminSignup, name='adminSignup'),
    path('logout/', views.LogoutPage, name='logout'),
    path('accommodation/', views.Accommodation, name='accommodation'),
    path('accommodation/accommodation_reg/', views.Accommodation_reg, name='accommodation_reg'),
    path('',views.LandingPage,name="landing"),
]