import datetime
from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone


class FirstYear(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    cgpa = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    branch = models.CharField(max_length=100)
    caste = models.CharField(max_length=10, null=True)
    payment_done = models.BooleanField(default=False)

class SecondYear(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    cgpa = models.FloatField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    branch = models.CharField(max_length=100)
    caste = models.CharField(max_length=10, null=True)
    payment_done = models.BooleanField(default=False)

class ThirdYear(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    cgpa = models.FloatField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    branch = models.CharField(max_length=100)
    caste = models.CharField(max_length=10, null=True)
    payment_done = models.BooleanField(default=False)

class FinalYear(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    cgpa = models.FloatField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    branch = models.CharField(max_length=100)
    caste = models.CharField(max_length=10, null=True)
    payment_done = models.BooleanField(default=False)
    
class SelectedDates(models.Model):
    registration_period = models.CharField(max_length=100)
    selected_students_list = models.DateField()
    preference_selection_date = models.CharField(max_length=100)
    final_room_allotment = models.DateField()
    verification_period = models.CharField(null=True, max_length=100)

class Contact(models.Model):
    first_name = models.CharField(max_length=100)
    last_name = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    email = models.EmailField()
    message = models.TextField()
    time = models.TimeField(default=datetime.time(hour=0, minute=0))


    def __str__(self):
        return f"{self.first_name} {self.last_name}"