from django.db import models

class CheckInOut(models.Model):
    mis = models.IntegerField ()
    year = models.CharField(max_length=100)
    reason = models.CharField(max_length=100)
    check_in_time = models.DateTimeField(null=True)
    check_out_time = models.DateTimeField(null=True)

class Notice(models.Model):
    date = models.DateField(null=True)
    message = models.CharField(max_length=200)
    file = models.FileField(upload_to='', null=True, blank=True)