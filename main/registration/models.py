from django.db import models

class CivilEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class ElectricalEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class ComputerEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class InstrumentationEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class ManfacturingEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

class MechanicalEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    percentile = models.FloatField()
    verified = models.BooleanField(default=False)
    selected = models.BooleanField(default=False)

# class HostelStudents(models.Model):
    
class CheckInOut(models.Model):
    student_name = models.CharField(max_length=100)
    mis= models.IntegerField (max_length=100)
    year = models.CharField(max_length=100)
    reason = models.CharField(max_length=100)
    check_in_time = models.DateTimeField('timezone.now')
    check_out_time = models.DateTimeField('timezone.now')

    
def creating_table(data):
    for item in data:
        student = CivilEngineering.objects.create(
            id=item[0],
            rank=item[1],
            application_id=item[2],
            email=item[3],
            name=item[4],
            gender=item[5],
            percentile=item[6]
        )
        student.save()
