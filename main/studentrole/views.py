from django.shortcuts import render, redirect
from django.http import Http404
from .models import *
from adminrole.models import Notice

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
    return render(request, 'studentrole.html',{'latest_notices': latest_notices})
