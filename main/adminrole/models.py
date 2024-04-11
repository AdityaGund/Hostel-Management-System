from django.db import models

class CheckInOut(models.Model):
    mis = models.IntegerField ()
    year = models.CharField(max_length=100)
    reason = models.CharField(max_length=100)
    check_in_time = models.DateTimeField(null=True)
    check_out_time = models.DateTimeField(null=True)