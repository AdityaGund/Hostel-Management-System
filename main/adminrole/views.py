from django.shortcuts import render, redirect, get_object_or_404
from guest.models import *
from studentrole.models import *
from django.core.mail import send_mail

def maintenance(request):
    # Retrieve all maintenance requests from the database
    all_requests = MaintenanceRequest.objects.all()

    # Separate requests into fulfilled and not fulfilled
    fulfilled_requests = all_requests.filter(fulfilled=True)
    not_fulfilled_requests = all_requests.filter(fulfilled=False)

    context = {
        'fulfilled_requests': fulfilled_requests,
        'pending_requests': not_fulfilled_requests,
    }

    return render(request, 'maintenance.html', context)

def send_confirmation_email(email, name, number, CheckIn, CheckOut, capacity):
    subject = 'Guest Booking Approved'
    message = f'Your guest room booking request at COEP hostel has been approved!\n\n\
    Booking Details:\n\
        Guest Name: {name}\n\
        Room No: {number}\n\
        Dates: {CheckIn} to {CheckOut}\n\
        No of Guests: {capacity}'
    from_email = 'djangoproject24@gmail.com'
    recipient_list = [email]
    send_mail(subject, message, from_email, recipient_list)

def guest_booking(request):
    if request.method == 'POST':
        action = request.POST.get('action')
        booking_id = request.POST.get('booking_id')

        if action == 'approve':
            booking = get_object_or_404(Booking, id=booking_id)
            booking.approved = True
            send_confirmation_email(booking.guest_email, booking.guest_name, booking.room.room_number, booking.check_in_date, booking.check_out_date, booking.room.capacity)
            booking.save()
        elif action == 'reject':
            booking = get_object_or_404(Booking, id=booking_id)
            booking.delete()

        return redirect('guest_booking')

    booking_requests = Booking.objects.filter(approved=False)
    return render(request, 'guest_booking.html', {'booking_requests': booking_requests})