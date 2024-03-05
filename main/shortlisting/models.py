from django.db import models

class Application(models.Model):
    application_id = models.CharField(max_length=10, unique=True)
    email = models.EmailField()