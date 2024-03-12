from django.shortcuts import render, redirect
from django.contrib import messages
from django.core.mail import send_mail
from .forms import EmailVerificationForm, OTPVerificationForm
from registration.models import *
import random
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

def get_email_from_application_id(application_id):
    models_to_check = [CivilEngineering, ElectricalEngineering, ComputerEngineering, InstrumentationEngineering, ManfacturingEngineering, MechanicalEngineering]

    for model in models_to_check:
        try:
            student = model.objects.get(application_id=application_id)
            email = student.email
            return email
        except model.DoesNotExist:
            pass
    return None

def send_verification_email(email, verification_code):
    subject = 'Verification Code'
    message = f'Your verification code is: {verification_code}'
    from_email = 'djangoproject24@gmail.com'
    recipient_list = [email]
    send_mail(subject, message, from_email, recipient_list)

def send_otp(request):
    if request.method == 'POST':
        form = EmailVerificationForm(request.POST)
        if form.is_valid():
            application_id = form.cleaned_data['application_id']
            email = get_email_from_application_id(application_id)
            if email is not None:
                verification_code = ''.join(random.choices('0123456789', k=6))
                request.session['verification_code'] = verification_code
                request.session['email'] = email
                send_verification_email(email, verification_code)
                messages.success(request, 'OTP sent successfully. Check your email.')
                return redirect('verify_otp')
            else:
                messages.error(request, 'User with the provided Application ID does not exist. Please try again.')
    else:
        form = EmailVerificationForm()

    return render(request, 'email_verification.html', {'form': form})

def verify_otp(request):
    if request.method == 'POST':
        form = OTPVerificationForm(request.POST)
        if form.is_valid():
            entered_otp = form.cleaned_data['otp']
            stored_otp = request.session.get('verification_code')
            email = request.session.get('email')
            if entered_otp == stored_otp:
                messages.success(request, 'Verification successful. Your email is verified.')
                return HttpResponse("success")
            else:
                messages.error(request, 'Invalid OTP. Please try again.')
    else:
        form = OTPVerificationForm()

    return render(request, 'otp_verification.html', {'form': form})

def generate_pdf(request):
    # Query selected students
    civil_selected = CivilEngineering.objects.filter(verification_status=True)
    electrical_selected = ElectricalEngineering.objects.filter(verification_status=True)
    computer_selected = ComputerEngineering.objects.filter(verification_status=True)
    instrumentation_selected = InstrumentationEngineering.objects.filter(verification_status=True)
    manufacturing_selected = ManfacturingEngineering.objects.filter(verification_status=True)
    mechanical_selected = MechanicalEngineering.objects.filter(verification_status=True)

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
        data = [['Name', 'Rank', 'Application ID', 'Email', 'Gender', 'Percentile']]
        for student in queryset:
            row = [student.name, str(student.rank), student.application_id, student.email, student.gender, str(student.percentile)]
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