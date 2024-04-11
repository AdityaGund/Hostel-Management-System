from django.db import models

class MaintenanceRequest(models.Model):
    user = models.CharField(max_length=10, null=True)
    description = models.TextField()
    fulfilled = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(upload_to='', blank=True, null=True)
