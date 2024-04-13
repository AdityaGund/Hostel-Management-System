from django.shortcuts import render, redirect, get_object_or_404
from guest.models import *
from studentrole.models import *
from registration.models import *
from .models import *
from .forms import *
from django.core.mail import send_mail
from django.utils import timezone
from datetime import datetime
from Amenities.models import *
from django.contrib import messages
from datetime import date

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

def send_confirmation_email(email, name, number, CheckIn, CheckOut, capacity, charges):
    subject = 'Guest Booking Approved'
    payment_url = f'http://127.0.0.1:8000/pay/?charges={charges}'  # Append charges as a query parameter
    message = f'Your guest room booking request at COEP hostel has been approved!\n\n\
    Booking Details:\n\
        Guest Name: {name}\n\
        Guest Name: Rs. {charges}\n\
        Room No: {number}\n\
        Dates: {CheckIn} to {CheckOut}\n\
        No of Guests: {capacity}\n\
        Payment URL: {payment_url}'  # Include the payment URL with charges
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
            send_confirmation_email(booking.guest_email, booking.guest_name, booking.room.room_number, booking.check_in_date, booking.check_out_date, booking.room.capacity, booking.charges)
            booking.save()
        elif action == 'reject':
            booking = get_object_or_404(Booking, id=booking_id)
            booking.delete()

        return redirect('guest_booking')

    booking_requests = Booking.objects.filter(approved=False)
    return render(request, 'guest_booking.html', {'booking_requests': booking_requests})

def checkinout(request):
    error_messages = []

    if request.method == 'POST':
        action = request.POST.get('action')
        if action == 'checkout':
            form = CheckOutForm(request.POST)
            if form.is_valid():
                mis = form.cleaned_data['mis']
                year = form.cleaned_data['year']
                year_model = None
                if year == 'FirstYear':
                    year_model = FirstYear
                elif year == 'SecondYear':
                    year_model = SecondYear
                elif year == 'ThirdYear':
                    year_model = ThirdYear
                else:
                    year_model = FinalYear

                student = year_model.objects.filter(application_id=mis, selected=True)
                if student.exists():
                    if CheckInOut.objects.filter(mis=mis, check_in_time=None).exists():
                        error_messages.append('This user is already checked out and has not checked in yet.')
                    else:
                        checkout = form.save(commit=False)
                        checkout.check_out_time = timezone.localtime(timezone.now())
                        checkout.save()
                        error_messages.append('User checked out successfully')
                else:
                    error_messages.append('No student found with the provided details.')

        elif action == 'checkin':
            form = CheckInForm(request.POST)
            if form.is_valid():
                mis = form.cleaned_data['mis']
                try:
                    student = CheckInOut.objects.get(mis=mis, check_in_time=None)
                    student.check_in_time = timezone.localtime(timezone.now())
                    student.save()
                    error_messages.append('User checked in successfully')
                except CheckInOut.DoesNotExist:
                    error_messages.append('This user is not checked out. Please check out first before checking in.')

    entries = CheckInOut.objects.all()
    checkinform = CheckInForm()
    checkoutform = CheckOutForm()
    return render(request, 'checkinout.html', {
        'checkinform': checkinform,
        'checkoutform': checkoutform,
        'entries': entries,
        'error_messages': error_messages
    })

def admin_home(request):
    bookings = Booking.objects.all()
    null_checkin_count = CheckInOut.objects.filter(check_in_time__isnull=True).count()
    dates_list = []
    current_year = datetime.now().year
    current_month = datetime.now().month
    monthly_data = [[0]*12 for i in range(2)]
    for booking in bookings:
        if booking.check_in_date.year == current_year:
            monthly_data[0][booking.check_in_date.month - 1] += 1
            monthly_data[1][booking.check_in_date.month - 1] += float(booking.charges)/1000
        dates_list.append([booking.check_in_date, booking.check_out_date, booking.room_id])
    total_rooms = GuestRoom.objects.count()
    dates_list.sort(key=lambda x: x[0])
    context = {
            'available_rooms':total_rooms,
            'not_available':0,
            'current_month': (monthly_data[1][current_month-1])*1000,
            'monthly_occupancy': monthly_data[0],
            'monthly_revenue': monthly_data[1],
            'checkouts': null_checkin_count
    }

    if request.method == 'POST':
        specific_date = request.POST.get('specificdate')
        specific_date = datetime.strptime(specific_date, '%Y-%m-%d').date()
        available_rooms = total_rooms

        for check_in_date, check_out_date, room_id in dates_list:
            if check_in_date <= specific_date:
                if check_out_date >= specific_date:
                    available_rooms -= 1
            else:
                break
        
        context = {
            'available_rooms':available_rooms,
            'not_available':total_rooms - available_rooms,
            'current_month': monthly_data[1][current_month-1]*1000,
            'monthly_occupancy': monthly_data[0],
            'monthly_revenue': monthly_data[1],
            'checkouts': null_checkin_count
        }

    return render(request, 'adminhome.html', context)

def notice_create(request):
    latest_notices = Notice.objects.all().order_by('-date')[:5]
    if request.method == 'POST':
        form = NoticeForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('add_notice') 
    else:
        form = NoticeForm()
    return render(request, 'notice_form.html', {'form': form,'latest_notices': latest_notices[::-1]})

def show_entries(request):
    entries = SlotBooking.objects.all()
    today = date.today()
    entries = SlotBooking.objects.filter(date=today)
    return render(request, 'clinic.html', {'entries': entries})


def checkoutstudents(request):
    checked_out_students = CheckInOut.objects.filter(check_out_time__isnull=False, check_in_time__isnull=True)
    
    return render(request, 'checkoutstudents.html', {'checked_out_students': checked_out_students})

def security_home(request):
    error_messages = []

    if request.method == 'POST':
        action = request.POST.get('action')
        if action == 'checkout':
            form = CheckOutForm(request.POST)
            if form.is_valid():
                mis = form.cleaned_data['mis']
                year = form.cleaned_data['year']
                year_model = None
                if year == 'FirstYear':
                    year_model = FirstYear
                elif year == 'SecondYear':
                    year_model = SecondYear
                elif year == 'ThirdYear':
                    year_model = ThirdYear
                else:
                    year_model = FinalYear

                student = year_model.objects.filter(application_id=mis, selected=True)
                if student.exists():
                    if CheckInOut.objects.filter(mis=mis, check_in_time=None).exists():
                        error_messages.append('This user is already checked out and has not checked in yet.')
                    else:
                        checkout = form.save(commit=False)
                        checkout.check_out_time = timezone.localtime(timezone.now())
                        checkout.save()
                        error_messages.append('User checked out successfully')
                else:
                    error_messages.append('No student found with the provided details.')

        elif action == 'checkin':
            form = CheckInForm(request.POST)
            if form.is_valid():
                mis = form.cleaned_data['mis']
                try:
                    student = CheckInOut.objects.get(mis=mis, check_in_time=None)
                    student.check_in_time = timezone.localtime(timezone.now())
                    student.save()
                    error_messages.append('User checked in successfully')
                except CheckInOut.DoesNotExist:
                    error_messages.append('This user is not checked out. Please check out first before checking in.')

    entries = CheckInOut.objects.all()
    checkinform = CheckInForm()
    checkoutform = CheckOutForm()
    return render(request, 'checkinout.html', {
        'checkinform': checkinform,
        'checkoutform': checkoutform,
        'entries': entries,
        'error_messages': error_messages
    })


# views.py
from shortlisting.models import Room
from registration.models import FirstYear, SecondYear, ThirdYear, FinalYear
from django.core.exceptions import ObjectDoesNotExist
def roomdetails(request):
    if request.method == 'POST':
        room_number = request.POST.get('room_number')
        year = request.POST.get('year')
        print(year)
        print(room_number)
        if room_number and year:
            try:
                # Query the Room table based on selected room number and year
                print("inside try")
                room_details = Room.objects.get(alloted_room=room_number, year=year)
                print(room_details)
                # Retrieve student names based on the year
                student_names = []
                if year == 'FirstYear':
                    student_names = [FirstYear.objects.get(id=room_details.student1).name,
                                     FirstYear.objects.get(id=room_details.student2).name,
                                     FirstYear.objects.get(id=room_details.student3).name,
                                     FirstYear.objects.get(id=room_details.student4).name]
                elif year == 'SecondYear':
                    student_names = [SecondYear.objects.get(application_id=room_details.student1).name,
                                     SecondYear.objects.get(application_id=room_details.student2).name,
                                     SecondYear.objects.get(application_id=room_details.student3).name,
                                     SecondYear.objects.get(application_id=room_details.student4).name]
                elif year == 'ThirdYear':
                    student_names = [ThirdYear.objects.get(id=room_details.student1).name,
                                     ThirdYear.objects.get(id=room_details.student2).name,
                                     ThirdYear.objects.get(id=room_details.student3).name,
                                     ThirdYear.objects.get(id=room_details.student4).name]
                elif year == 'FinalYear':
                    student_names = [FinalYear.objects.get(id=room_details.student1).name,
                                     FinalYear.objects.get(id=room_details.student2).name,
                                     FinalYear.objects.get(id=room_details.student3).name,
                                     FinalYear.objects.get(id=room_details.student4).name]

                return render(request, 'roomdetails.html', {'room_details': [room_details], 'student_names': student_names})
            except ObjectDoesNotExist:
                return render(request, 'roomdetails.html', {'error_message': f'No room found for room number {room_number} and year {year}.'})
        else:
            return render(request, 'roomdetails.html', {'error_message': 'Please select both the fields.'})
    else:
        return render(request, 'roomdetails.html')
