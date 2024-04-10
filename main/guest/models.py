from django.db import models

class GuestRoom(models.Model):
    room_number = models.CharField(max_length=10)
    capacity = models.IntegerField()

class Booking(models.Model):
    room = models.ForeignKey(GuestRoom, on_delete=models.CASCADE, related_name='bookings')
    check_in_date = models.DateField()
    check_out_date = models.DateField()
    guest_name = models.CharField(max_length=100)
    guest_email = models.EmailField()
    id_proof = models.FileField(upload_to='', null=True, blank=True)
    approved = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.guest_name} ({self.check_in_date} - {self.check_out_date})"