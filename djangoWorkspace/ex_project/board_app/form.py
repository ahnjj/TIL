from django import forms

# forms.Form 상속
class BoardForm(forms.Form):
    title = forms.CharField(max_length=10,
                           label='제목2')
    content = forms.IntegerField(label="내용2")