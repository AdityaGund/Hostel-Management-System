from registration.models import *
from django.http import HttpResponse
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
from registration.models import CivilEngineering, ElectricalEngineering, ComputerEngineering, InstrumentationEngineering, ManfacturingEngineering, MechanicalEngineering
from reportlab.platypus import Paragraph, Spacer, Table, PageTemplate
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib import colors
from reportlab.platypus import Table, TableStyle
from reportlab.platypus.doctemplate import PageTemplate, BaseDocTemplate
from reportlab.lib.styles import getSampleStyleSheet
from reportlab.lib.units import inch
from django.shortcuts import render, redirect
from django.contrib import messages
from .models import RoommateRequest, Room
from django.contrib.auth.decorators import login_required

def generate_pdf(request):
    # Query selected students
    civil_selected = CivilEngineering.objects.filter(selected=True)
    electrical_selected = ElectricalEngineering.objects.filter(selected=True)
    computer_selected = ComputerEngineering.objects.filter(selected=True)
    instrumentation_selected = InstrumentationEngineering.objects.filter(selected=True)
    manufacturing_selected = ManfacturingEngineering.objects.filter(selected=True)
    mechanical_selected = MechanicalEngineering.objects.filter(selected=True)

    # Generate PDF report
    response = HttpResponse(content_type='application/pdf')
    response['Content-Disposition'] = 'attachment; filename="selected_students_report.pdf"'

    doc = SimpleDocTemplate(response, pagesize=letter)
    elements = []

    def add_table_to_doc(heading, queryset):
        # Define styles
        styles = getSampleStyleSheet()
        heading_style = styles['Heading1']
        table_style = styles['Normal']

        # Add heading
        elements.append(Paragraph(heading, heading_style))
        elements.append(Spacer(1, 12))  # Add space below heading

        # Add table
        data = [['Name', 'Rank', 'Application ID', 'Email', 'Percentile']]
        for student in queryset:
            row = [student.name, str(student.rank), student.application_id, student.email, str(student.percentile)]
            data.append(row)

        # Generate table as a list of Paragraph objects
        table_data = []
        for row in data:
            row_data = [Paragraph(cell, table_style) for cell in row]
            table_data.append(row_data)

        # Add borders to table
        table_style = TableStyle([('GRID', (0, 0), (-1, -1), 1, colors.black)])  # Add border to all cells
        table = Table(table_data)
        table.setStyle(table_style)

        # Add table to elements
        elements.append(table)
        elements.append(Spacer(1, 12))  # Add space after table


    # Add tables for each branch
    add_table_to_doc("Civil Engineering", civil_selected)
    add_table_to_doc("Electrical Engineering", electrical_selected)
    add_table_to_doc("Computer Engineering", computer_selected)
    add_table_to_doc("Instrumentation Engineering", instrumentation_selected)
    add_table_to_doc("Manufacturing Engineering", manufacturing_selected)
    add_table_to_doc("Mechanical Engineering", mechanical_selected)

    doc.build(elements)
    return response

def select_students(request):
    selected_students = []

    mech_students = MechanicalEngineering.objects.filter(verified=True).order_by('rank')[:20]
    selected_students.extend(mech_students)

    comp_students = ComputerEngineering.objects.filter(verified=True).order_by('rank')[:20]
    selected_students.extend(comp_students)

    other_students = []
    branches = [CivilEngineering, ElectricalEngineering, InstrumentationEngineering, ManfacturingEngineering]

    for branch in branches:
        branch_students = branch.objects.filter(verified=True).order_by('rank')[:10]
        other_students.extend(branch_students)

    selected_students.extend(other_students)

    remaining_seats = 80 - len(selected_students)

    if remaining_seats > 0:
        top_verified_students = (CivilEngineering.objects.filter(verified=True) +
                                 ElectricalEngineering.objects.filter(verified=True) +
                                 InstrumentationEngineering.objects.filter(verified=True) +
                                 ManfacturingEngineering.objects.filter(verified=True)).order_by('rank')[:remaining_seats]

        selected_students.extend(top_verified_students)
    
    for student in selected_students:
            student.selected = True
            student.save()

@login_required
def send_roommate_request(request):
    if request.method == 'POST':
        sender_application_id = request.user.username
        receiver_application_id = request.POST.get('receiver_application_id')
        if sender_application_id == receiver_application_id:
            messages.error(request, "You cannot send request to yourself!")
            return redirect('send_roommate_request')
        if not receiver_application_id:
            messages.error(request, "Receiver application ID is required.")
            return redirect('send_roommate_request')

        sender_exists = User.objects.filter(username=sender_application_id).exists()
        receiver_exists = User.objects.filter(username=receiver_application_id).exists()
        if not (sender_exists and receiver_exists):
            messages.error(request, "Sender or receiver does not exist.")
            return redirect('send_roommate_request')

        if RoommateRequest.objects.filter(sender_application_id=sender_application_id,
                                           receiver_application_id=receiver_application_id, accepted=False).exists():
            messages.error(request, "You have already sent a roommate request to this user.")
            return redirect('send_roommate_request')
        
        if RoommateRequest.objects.filter(sender_application_id=receiver_application_id,
                                           receiver_application_id=sender_application_id).exists():
            messages.error(request, f"{receiver_application_id} has already sent a roommate request to you.")
            return redirect('send_roommate_request')

        RoommateRequest.objects.create(sender_application_id=sender_application_id,
                                       receiver_application_id=receiver_application_id)
        messages.success(request, f"Roommate request sent to {receiver_application_id}.")
        return redirect('send_roommate_request')
    else:
        return render(request, 'send_roommate_request.html')

@login_required
def roommate_requests(request):
    if request.method == 'POST':
        # Handle form submission for accepting/rejecting requests
        request_id = request.POST.get('request_id')
        action = request.POST.get('action')
        if action == 'accept':
            # Logic to accept the request
            roommate_request = RoommateRequest.objects.get(id=request_id)
            roommate_request.accepted = True
            roommate_request.save()

            sender = roommate_request.sender_application_id
            receiver = roommate_request.receiver_application_id

            # Check if a room already exists with the sender and has a vacancy
            existing_room = None
            for sender_field in ['student1', 'student2', 'student3', 'student4']:
                existing_room = Room.objects.filter(**{sender_field: sender}).first()
                if existing_room:
                    break
            if not existing_room:
                existing_room = Room.objects.create(student1=sender)
                #delete pending reqeusts received by sender after becoming part of room
                pending_received_requests = RoommateRequest.objects.filter(receiver_application_id=sender, accepted=False)
                pending_received_requests.delete()

            for receiver_field in ['student1', 'student2', 'student3', 'student4']:
                if getattr(existing_room, receiver_field) is None:
                    # Assign the receiver value to the first null spot
                    setattr(existing_room, receiver_field, receiver)
                    #delete pending reqeusts received by receiver after becoming part of room
                    pending_received_requests = RoommateRequest.objects.filter(receiver_application_id=receiver, accepted=False)
                    pending_received_requests.delete()
                    break
            
            existing_room.save()

            # Check if the room is now full
            if all(getattr(existing_room, f'student{i}') is not None for i in range(1, 5)):
                # Delete all pending requests of four students
                RoommateRequest.objects.filter(
                    sender_application_id__in=[existing_room.student1,
                                                existing_room.student2,
                                                existing_room.student3,
                                                existing_room.student4],
                    accepted=False
                ).delete()
                RoommateRequest.objects.filter(
                    receiver_application_id__in=[existing_room.student1,
                                                    existing_room.student2,
                                                    existing_room.student3,
                                                    existing_room.student4],
                    accepted=False
                ).delete()

            # Redirect to the same page
            return redirect('roommate_requests')
        elif action == 'reject':
            # Logic to reject the request
            RoommateRequest.objects.filter(id=request_id).delete()
            # Redirect to the same page
            return redirect('roommate_requests')
    else:
        # Retrieve pending and accepted roommate requests
        user_application_id = request.user.username
        pending_received_requests = RoommateRequest.objects.filter(receiver_application_id=user_application_id, accepted=False)
        pending_sent_requests = RoommateRequest.objects.filter(sender_application_id=user_application_id, accepted=False)
        accepted_sent_requests = RoommateRequest.objects.filter(sender_application_id=user_application_id, accepted=True)
        accepted_received_requests = RoommateRequest.objects.filter(receiver_application_id=user_application_id, accepted=True)

        # Check if the user is part of any room and get room details if available
        room_details = None
        for sender_field in ['student1', 'student2', 'student3', 'student4']:
            existing_room = Room.objects.filter(**{sender_field: user_application_id}).first()
            if existing_room:
                room_details = {
                    'student1': existing_room.student1,
                    'student2': existing_room.student2,
                    'student3': existing_room.student3,
                    'student4': existing_room.student4
                }
                break

            

        return render(request, 'roommate_requests.html', {
            'pending_received_requests': pending_received_requests,
            'pending_sent_requests': pending_sent_requests,
            'accepted_sent_requests': accepted_sent_requests,
            'accepted_received_requests': accepted_received_requests,
            'room_details': room_details
        })
