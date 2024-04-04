from registration.models import *
from django.http import HttpResponse
from reportlab.lib import colors
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle
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
from django.shortcuts import render
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.db.models import Q, Value
from django.db.models.functions import Length
from django.db.models import CharField
from django.contrib.postgres.search import TrigramSimilarity
from django.shortcuts import get_object_or_404
from django.contrib.contenttypes.models import ContentType
from django.http import JsonResponse

def studentHome(request):
    return render(request, 'studentHome.html')

def generate_pdf(request):
    # Query selected students
    civil_selected = FirstYear.objects.filter(branch="CivilEngineering", selected=True)
    electrical_selected = FirstYear.objects.filter(branch="ElectricalEngineering", selected=True)
    computer_selected = FirstYear.objects.filter(branch="ComputerEngineering", selected=True)
    instrumentation_selected = FirstYear.objects.filter(branch="InstrumentationEngineering", selected=True)
    manufacturing_selected = FirstYear.objects.filter(branch="ManfacturingEngineering", selected=True)
    mechanical_selected = FirstYear.objects.filter(branch="MechanicalEngineering", selected=True)

    print(civil_selected)

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

    mech_students = FirstYear.objects.filter(branch="MechanicalEngineering", verified=True).order_by('rank')[:20]
    selected_students.extend(mech_students)

    comp_students = FirstYear.objects.filter(branch="ComputerEngineering", verified=True).order_by('rank')[:20]
    selected_students.extend(comp_students)

    other_students = []
    branches = ["CivilEngineering", "ElectricalEngineering", "InstrumentationEngineering", "ManfacturingEngineering"]

    for branch in branches:
        branch_students = FirstYear.objects.filter(branch=branch, verified=True).order_by('rank')[:10]
        other_students.extend(branch_students)

    selected_students.extend(other_students)

    remaining_seats = 80 - len(selected_students)

    if remaining_seats > 0:
        top_verified_students = (FirstYear.objects.filter(branch="CivilEngineering", verified=True) +
                                 FirstYear.objects.filter(branch="ElectricalEngineering", verified=True) +
                                 FirstYear.objects.filter(branch="InstrumentationEngineering", verified=True) +
                                 FirstYear.objects.filter(branch="ManfacturingEngineering", verified=True) +
                                 FirstYear.objects.filter(branch="ComputerEngineering", verified=True) +
                                 FirstYear.objects.filter(branch="MechanicalEngineering", verified=True)).order_by('rank')[:remaining_seats]

        selected_students.extend(top_verified_students)
    
    for student in selected_students:
            student.selected = True
            student.save()



@login_required
def send_roommate_request(request):
    if request.method == 'POST':

        print("hello world")
        selected_branch = request.GET.get('branch', '')
        print(selected_branch)


        sender_application_id = request.user.username
        receiver_application_id = request.POST.get('receiver_application_id')

        if sender_application_id == receiver_application_id:
            return JsonResponse({'success': False, 'message': "You cannot send a request to yourself!"}, status=400)

        if not receiver_application_id:
            return JsonResponse({'success': False, 'message': "Receiver application ID is required!"}, status=400)

        sender_exists = User.objects.filter(username=sender_application_id).exists()
        receiver_exists = User.objects.filter(username=receiver_application_id).exists()
        if not (sender_exists and receiver_exists):
            return JsonResponse({'success': False, 'message': "Sender or receiver does not exist!"}, status=400)

        if RoommateRequest.objects.filter(sender_application_id=sender_application_id,
                                           receiver_application_id=receiver_application_id, accepted=False).exists():
            return JsonResponse({'success': False, 'message': "You have already sent a roommate request to this user."})

        if RoommateRequest.objects.filter(sender_application_id=receiver_application_id,
                                           receiver_application_id=sender_application_id).exists():
            return JsonResponse({'success': False, 'message': f"{receiver_application_id} has already sent a roommate request to you."})

        # selected_branch = request.GET.get('branch', '')
        # if selected_branch == 'CivilEngineering':
        #     StudentModel = CivilEngineering
        # elif selected_branch == 'ElectricalEngineering':
        #     StudentModel = ElectricalEngineering
        # elif selected_branch == 'ComputerEngineering':
        #     StudentModel = ComputerEngineering
        # elif selected_branch == 'MechanicalEngineering':
        #     StudentModel = MechanicalEngineering
        # elif selected_branch == 'ManfacturingEngineering':
        #     StudentModel = ManfacturingEngineering
        # elif selected_branch == 'InstrumentationEngineering':
        #     StudentModel = InstrumentationEngineering
        # else:
        #     StudentModel = CivilEngineering

        RoommateRequest.objects.create(sender_application_id=sender_application_id,
                                       receiver_application_id=receiver_application_id)

        # student = get_object_or_404(StudentModel, application_id=receiver_application_id)
        # student.request_sent = True
        # student.save()

        return JsonResponse({'success': True, 'message': f"Roommate request sent to {receiver_application_id}."})
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


# for passing the student list into the html file 

def student_list(request):
    selected_branch = request.GET.get('branch', '')
    search_query = request.GET.get('q', '')

    # Define the queryset based on the selected branch
    # if selected_branch:
    #     if selected_branch == 'CivilEngineering':
    #         students = CivilEngineering.objects.all()
    #     elif selected_branch == 'ElectricalEngineering':
    #         students = ElectricalEngineering.objects.all()
    #     elif selected_branch == 'MechanicalEngineering':
    #         students = MechanicalEngineering.objects.all()
    #     elif selected_branch == 'ComputerEngineering':
    #         students = ComputerEngineering.objects.all()
    #     elif selected_branch == 'InstrumentationEngineering':
    #         students = InstrumentationEngineering.objects.all()
    #     elif selected_branch == 'ManfacturingEngineering':
    #         students = ManfacturingEngineering.objects.all()
    #     else:
    #         # Default to Computer Engineering if branch is not specified or invalid
    #         students = ComputerEngineering.objects.all()
    # else:
    #     # Default to Computer Engineering if branch is not specified
    #     students = ComputerEngineering.objects.all()

    if selected_branch:
        students = FirstYear.objects.filter(branch=selected_branch, selected=True)
    # else:
    #     students = FirstYear.objects.filter(branch="ComputerEngineering", selected=True)
    #     selected_branch = ComputerEngineering
    # Filter students based on search query
    if search_query:
        students = students.filter(name__icontains=search_query)

    # Paginate the queryset
    paginator = Paginator(students, 10)  # Show 10 students per page
    page_number = request.GET.get('page', 1)
    page_obj = paginator.get_page(page_number)

    # students_list = list(students.values())  # or students.values_list()

    # Print students list in console
    # print(students_list)


    context = {
        'students': page_obj,
        'selected_branch': selected_branch,
    }
    # rint(context[students])


    return render(request, 'send_roommate_request.html', context)