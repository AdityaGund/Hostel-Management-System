from django.urls import path
from . import views

urlpatterns = [
    path('guest_room/', views.guestroom, name='guestroom'),
    path('book_room/', views.book_room, name='book_room'),
    path('book_room/<int:room_id>/', views.book_room, name='book_room'),
    path('pay/', views.pay_form, name='pay_form'),
]