from django.urls import path
from .views import SignupPage, LoginPage, HomePage, LogoutPage

urlpatterns = [
    path('login/', LoginPage, name='login'),
    path('signup/', SignupPage, name='signup'),
    path('home/', HomePage, name='home'),
    path('logout/', LogoutPage, name='logout'),
]