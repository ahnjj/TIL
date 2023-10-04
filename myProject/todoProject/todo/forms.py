from dataclasses import field
from django import forms
from .models import Todo

# end_date 
class DateInput(forms.DateInput):
    input_type = 'date'


class TodoForm(forms.ModelForm):
    class Meta:
        model = Todo
        fields = ('title','description','important','end_date')
        widgets = {
            'end_date' : DateInput()
        }