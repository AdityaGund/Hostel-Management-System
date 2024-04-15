from django.shortcuts import render, redirect
from django.http import Http404
from prompt_toolkit import HTML
from .models import *
from adminrole.models import Notice
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import *
from django.http import HttpResponse
from django.template.loader import render_to_string
# from weasyprint import HTML

def maintenance_request(request):
    if request.method == 'POST':
        submit_action = request.POST.get('submit_action')
        if submit_action == 'Mark Fulfilled':
            request_id = request.POST.get('request_id')
            try:
                maintenance_request = MaintenanceRequest.objects.get(id=request_id)
                maintenance_request.fulfilled = True
                maintenance_request.save()
            except MaintenanceRequest.DoesNotExist:
                raise Http404("Maintenance request does not exist")
            return redirect('maintenance_request')
        else:
            description = request.POST.get('description')
            image = request.FILES.get('image')
            if description:  # Ensure description is not empty
                application_id = request.user.username
                maintenance_request = MaintenanceRequest(user=application_id, description=description, image=image)
                maintenance_request.save()
                return redirect('maintenance_request')  # Redirect to the maintenance request page after creating a new request

    # Retrieve all maintenance requests from the database
    all_requests = MaintenanceRequest.objects.filter(user=request.user.username)

    # Separate requests into fulfilled and not fulfilled
    fulfilled_requests = all_requests.filter(fulfilled=True)
    not_fulfilled_requests = all_requests.filter(fulfilled=False)

    context = {
        'fulfilled_requests': fulfilled_requests,
        'pending_requests': not_fulfilled_requests,
    }

    return render(request, 'maintenance_request.html', context)

def studentrole_index(request):
    latest_notices = Notice.objects.all().order_by('-date')[:5]
    return render(request, 'studentrole.html',{'latest_notices': latest_notices[::-1]})

@login_required
def bonafied_request(request):
    if request.method == 'POST':
        form = BonafiedRequestForm(request.POST, request.FILES)
        if form.is_valid():
            bonafied_request = form.save()
            return redirect('bonafied_request_list')
    else:
        form = BonafiedRequestForm()
    return render(request, 'bonafied_request.html', {'form': form})

@login_required
def bonafied_request_list(request):
    bonafied_requests = BonafiedRequest.objects.all()
    return render(request, 'bonafied_request_list.html', {'bonafied_requests': bonafied_requests})


from xhtml2pdf import pisa
@login_required
def download_bonafied_certificate(request, pk):
    bonafied_request = BonafiedRequest.objects.get(pk=pk)
    if bonafied_request.approved:
        html_string = render_to_string('bonafied_certificate.html', {'bonafied_request': bonafied_request})

        response = HttpResponse(content_type='application/pdf')
        response['Content-Disposition'] = 'attachment; filename="bonafied_certificate.pdf"'

        # Create PDF
        pisa_status = pisa.CreatePDF(html_string, dest=response)
        if pisa_status.err:
            return HttpResponse('We had some errors <pre>' + html_string + '</pre>')
        return response
    else:
        return redirect('bonafied_request_list')
