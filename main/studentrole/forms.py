from django import forms
from .models import BonafiedRequest

class BonafiedRequestForm(forms.ModelForm):
    class Meta:
        model = BonafiedRequest
        fields = ['name', 'id_proof', 'reason']