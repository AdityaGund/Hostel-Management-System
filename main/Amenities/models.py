from django.db import models
from django.contrib.auth.models import User
# Create your models here.


class Meal(models.Model):
    day_of_week = models.CharField(max_length=10,default = 'Mon')
    morning_meal_name = models.CharField(max_length=100,default = 'abc')
    dinner_meal_name = models.CharField(max_length=100,default = 'bcd')
    description = models.CharField(max_length=100,default = 'bcd')
    
class attendance(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length = 100)
    date = models.DateField(auto_now_add = True)
    date_of_leave = models.CharField(max_length = 20,default = None)
    is_attending_morning = models.BooleanField(default=True)
    is_attending_night = models.BooleanField(default=True)
    is_penalty=  models.BooleanField(default=False)
    is_penalty_morning=  models.BooleanField(default=False)
    is_penalty_night=  models.BooleanField(default=False)
    month = models.IntegerField(default=0)

class MessBills(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    name = models.CharField(max_length = 100)
    month = models.IntegerField(default = 0)
    bill_status_is_paid = models.BooleanField(default = False)
    bill_amount = models.IntegerField(default=0)
    month_name = models.CharField(max_length = 20,default='abc')

from django.db import models

class ClinicSlot(models.Model):
    time = models.CharField(max_length=10)

    def __str__(self):
        return self.time

class SlotBooking(models.Model):
    slot = models.ForeignKey(ClinicSlot, on_delete=models.CASCADE, related_name='bookings')
    date = models.DateField(null=True)
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=100, null=True)

    def __str__(self):
        return f"{self.name} - {self.slot.time} ({self.date})"