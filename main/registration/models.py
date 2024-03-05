from django.db import models
import random
import string

class CivilEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    percentile = models.FloatField()
class ElectricalEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    percentile = models.FloatField()
class ComputerEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    percentile = models.FloatField()

class InstrumentationEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    percentile = models.FloatField()


class ManfacturingEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    percentile = models.FloatField()

class MechanicalEngineering(models.Model):
    id = models.AutoField(primary_key=True)
    rank = models.IntegerField()
    application_id = models.CharField(max_length=10)
    email = models.EmailField()
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=10)
    percentile = models.FloatField()


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
