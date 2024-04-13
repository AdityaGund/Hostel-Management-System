from django.urls import path
from . import views

urlpatterns = [
    # path('Amenities/',views.amenities,name='amenities'),
    path('meal/',views.meal,name="meal"),
    path('meal/leave',views.leave,name = "leave"),
    path('coepMess/',views.coepMess,name="coepMess"),
    path('coepMess/change_meal',views.change_meal,name = 'change_meal'),
    path('meal_status/',views.meal_status,name = 'meal_status'),
    path('meal_history/',views.meal_history,name='meal_history'),
    path('meal_history/historyCheck',views.historyCheck,name="historyCheck"),
    path('studentBills/',views.studentBills,name = 'studentBills'),
    path('studentBills/checkBill',views.checkBill,name = 'checkBill'),
    path('createBills/',views.createBills,name = "createBills"),
    path('createBills/createdBills',views.createdBills,name = 'createdBills'),
    path('book_slot/', views.book_slot, name='book_slot'),
]
