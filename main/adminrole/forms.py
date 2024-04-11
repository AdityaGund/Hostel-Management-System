from django import forms
from .models import CheckInOut

class CheckOutForm(forms.ModelForm):
    YEAR_CHOICES = [
        ('FirstYear', 'First Year'),
        ('SecondYear', 'Second Year'),
        ('ThirdYear', 'Third Year'),
        ('FinalYear', 'Final Year'),
    ]
    
    year = forms.ChoiceField(choices=YEAR_CHOICES)
    
    class Meta:
        model = CheckInOut
        fields = ['mis', 'year', 'reason']

class CheckInForm(forms.ModelForm):
    class Meta:
        model = CheckInOut
        fields = ['mis']