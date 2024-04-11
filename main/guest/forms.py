from django import forms
from .models import Booking

class AvailabilityForm(forms.ModelForm):
    class Meta:
        model = Booking
        fields = ['check_in_date', 'check_out_date']
        widgets = {
            'check_in_date': forms.DateInput(attrs={'type': 'date'}),
            'check_out_date': forms.DateInput(attrs={'type': 'date'}),
        }

class BookingForm(forms.ModelForm):
    id_proof = forms.FileField(label='Upload ID Proof', required=False)

    class Meta:
        model = Booking
        fields = ['guest_name', 'guest_email', 'id_proof']

    def __init__(self, *args, **kwargs):
        self.request = kwargs.pop('request', None)
        super(BookingForm, self).__init__(*args, **kwargs)

    def clean_id_proof(self):
        id_proof = self.cleaned_data.get('id_proof')
        if id_proof:
            return id_proof
        else:
            return None