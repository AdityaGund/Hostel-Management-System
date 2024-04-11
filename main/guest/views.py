from django.shortcuts import render, redirect, get_object_or_404
from .models import GuestRoom, Booking
from .forms import BookingForm, AvailabilityForm
from datetime import datetime

def guestroom(request):
    if request.method == 'POST':
        availability_form = AvailabilityForm(request.POST)
        if availability_form.is_valid():
            check_in_date = availability_form.cleaned_data['check_in_date']
            check_out_date = availability_form.cleaned_data['check_out_date']

            # Save dates in session
            request.session['check_in_date'] = check_in_date.strftime('%Y-%m-%d')
            request.session['check_out_date'] = check_out_date.strftime('%Y-%m-%d')

            # Get all rooms that don't have any bookings or bookings that don't overlap with the provided dates
            available_rooms = GuestRoom.objects.exclude(
                bookings__check_in_date__lte=check_out_date,
                bookings__check_out_date__gte=check_in_date
            )

            context = {
                'available_rooms': available_rooms,
                'availability_form': availability_form,
            }
            return render(request, 'available_rooms.html', context)
    else:
        availability_form = AvailabilityForm()

    context = {
        'availability_form': availability_form,
    }
    return render(request, 'guestroom.html', context)

def book_room(request, room_id=None):
    room = get_object_or_404(GuestRoom, id=room_id) if room_id else None

    if request.method == 'POST':
        booking_form = BookingForm(request.POST, request.FILES, request=request)
        if booking_form.is_valid():
            booking = booking_form.save(commit=False)
            booking.room = room
            check_in_date_str = request.session.get('check_in_date')
            check_out_date_str = request.session.get('check_out_date')
            booking.check_in_date = datetime.strptime(check_in_date_str, '%Y-%m-%d').date()
            booking.check_out_date = datetime.strptime(check_out_date_str, '%Y-%m-%d').date()
            days = abs((booking.check_out_date-booking.check_in_date).days)
            if booking.room.capacity == 2:
                booking.charges = days*200
            elif booking.room.capacity == 3:
                booking.charges = days*250
            else:
                booking.charges = days*300
            booking.save()
            return redirect('guestroom')
    else:
        booking_form = BookingForm(initial={'room': room}, request=request)

    context = {
        'booking_form': booking_form,
        'room': room,
    }
    return render(request, 'book_room.html', context)