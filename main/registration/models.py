from django.db import models
import random
import string

def generate_random_email():
    letters = string.ascii_lowercase
    return ''.join(random.choice(letters) for i in range(10)) + '@gmail.com'
# below is the data for civil engineering students
data = [
    (1, 1428, 'EN23185238',generate_random_email(), 'KADAM ANISH ANIL', 'M', 99.4114040),
    (2, 1940, 'EN23223626',generate_random_email(), 'PATIL ARNAV AJAY', 'M', 99.2111179),
    (3, 2774, 'EN23149998',generate_random_email(), 'SURYAWANSHI SHIVRAJ SANJAY', 'M', 98.8972243),
    (4, 2941, 'EN23173012',generate_random_email(), 'LANJEWAR SAHIL VINOD', 'M', 98.8527647),
    (5, 3272, 'EN23217414',generate_random_email(), 'AASHVARDHAN SINGH CHAUHAN', 'M', 98.7149343),
    (6, 3301, 'EN23145658',generate_random_email(), 'DEOGHARE VEDANT RAKESH', 'M', 98.7018851),
    (7, 3396, 'EN23173586',generate_random_email(), 'ANSHUMAN SARANG PATIL', 'M', 98.6673674),
    (8, 3422, 'EN23126225',generate_random_email(), 'OZA OM SUNIL', 'M', 98.6614529),
    (9, 3690, 'EN23215591',generate_random_email(), 'PATIL PIYUSH VIJAY', 'M', 98.5636938),
    (10, 3930, 'EN23213221',generate_random_email(), 'BHAVESH KAPURE', 'M', 98.4796982),
    (11, 3935, 'EN23234117',generate_random_email(), 'NEHARKAR HARSHAL PREMCHAND', 'M', 98.4796982),
    (12, 3990, 'EN23160416',generate_random_email(), 'PAWAR SAIRAJ SANTOSH', 'M', 98.4546548),
    (13, 4102, 'EN23112605',generate_random_email(), 'MUSALE HIMALAY KISHOR', 'M', 98.3975197),
    (14, 4172, 'EN23116857',generate_random_email(), 'CHITTORA RITESH PURUSHOTTAM', 'M', 98.3772737),
    (15, 4191, 'EN23111306',generate_random_email(), 'TAPKIR VEDANT SANDEEP', 'M', 98.3681757),
    (16, 4362, 'EN23214726',generate_random_email(), 'SHAURYEARAJ YUVRAJ NEEMA KUMAR', 'M', 98.2961113),
    (17, 4654, 'EN23163281',generate_random_email(), 'DHAGE ATHARV RAMESH', 'M', 98.1920480),
    (18, 4676, 'EN23183634',generate_random_email(), 'KEKADE SNEHIT MANOJ', 'M', 98.1917154),
    (19, 4959, 'EN23110896',generate_random_email(), 'CHANAKYA NAVGHARE', 'M', 98.0761344),
    (20, 4998, 'EN23129839',generate_random_email(), 'ANJALI JADHAV', 'F', 98.0707133),
    (21, 5046, 'EN23168100',generate_random_email(), 'WASADE UTKARSH JITENDRA', 'M', 98.0592365),
    (22, 5168, 'EN23146388',generate_random_email(), 'VIBHANDIK KAUSTUBH SANJAY', 'M', 98.0055132),
    (23, 5340, 'EN23134835',generate_random_email(), 'NIRMIT DHARMALE', 'M', 97.9358267),
    (24, 5600, 'EN23171272',generate_random_email(), 'RATHI PRANJAL SANTOSH', 'F', 97.8417807),
    (25, 5691, 'EN23201433',generate_random_email(), 'KOLHE HARIDARSHAN KAILAS', 'M', 97.7965436),
    (26, 5736, 'EN23116852',generate_random_email(), 'KAKADE SAMEERA SATISH', 'F', 97.7845902),
    (27, 5864, 'EN23137499',generate_random_email(), 'RITISHAA ANAND', 'F', 97.7443048),
    (28, 6348, 'EN23217922',generate_random_email(), 'PATIL RASHIKA PRASHANT', 'F', 97.5524607),
    (29, 6423, 'EN23223671',generate_random_email(), 'GHULE ATHARVA DILIPKUMAR', 'M', 97.5196409),
    (30, 6592, 'EN23165665',generate_random_email(), 'PADULKAR SHIRISH SUNIL', 'M', 97.4823503)
]

#  below is the data for electrical engineering studetns


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

# CivilEngineering.create_from_data(data)