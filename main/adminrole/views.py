from django.shortcuts import render
from studentrole.models import *

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