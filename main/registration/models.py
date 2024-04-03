from django.db import models
from django.contrib.auth.models import User
from registration.databasegeneration import second_year_data

class Second_Year(models.Model):
    mis_no = models.CharField(max_length=20)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    cgpa = models.DecimalField(max_digits=4, decimal_places=2)
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    branch = models.CharField(max_length=100)

class Third_Year(models.Model):
    mis_no = models.CharField(max_length=20)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    cgpa = models.DecimalField(max_digits=4, decimal_places=2)
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    branch = models.CharField(max_length=100)

class FirstYear(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)
    branch = models.CharField(max_length=100)




class CivilEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class ElectricalEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class ComputerEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class InstrumentationEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class ManfacturingEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class MechanicalEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)


# TRYING TO DO IN SINGLE TABLE FIRST YEAR


# class HostelStudents(models.Model):
    
class CheckInOut(models.Model):
    student_name = models.CharField(max_length=100)
    mis= models.IntegerField ()
    year = models.CharField(max_length=100)
    reason = models.CharField(max_length=100)
    check_in_time = models.DateTimeField('timezone.now')
    check_out_time = models.DateTimeField('timezone.now')

    
