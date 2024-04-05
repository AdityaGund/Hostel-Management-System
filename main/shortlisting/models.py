from django.db import models

class RoommateRequest(models.Model):
    sender_application_id = models.CharField(max_length=10)
    receiver_application_id = models.CharField(max_length=10)
    year = models.CharField(max_length=10, null=True)
    accepted = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Request from {self.sender_application_id} to {self.receiver_application_id}"
    
class Room(models.Model):
    id = models.AutoField(primary_key=True)
    year = models.CharField(max_length=10, null=True)
    student1 = models.CharField(max_length=10, null=True)
    student2 = models.CharField(max_length=10, null=True)
    student3 = models.CharField(max_length=10, null=True)
    student4 = models.CharField(max_length=10, null=True)