from django.urls import reverse_lazy
from django.views.generic import CreateView, DetailView
from django_filters.views import FilterView
from django_tables2 import SingleTableView                  # <-- Add this line

from jeonse.filters import ListingFilter  
from jeonse.forms import ListingForm
from jeonse.mixins import UserIsAuthenticatedMixin, UserIsCreatorMixin
from jeonse.models import Listing
from jeonse.tables import ListingTable                      # <-- Add this line


class ListingListView(UserIsAuthenticatedMixin, FilterView, SingleTableView):
    model = Listing
    template_name = "jeonse/listing_list.html"
    table_class = ListingTable                                # <-- Add this line
    filterset_class = ListingFilter

    def get_queryset(self):
        return self.request.user.listings.all()
    
    def get_template_names(self):                           # <-- Add this method
        if self.request.htmx:                               # <-- Add this line    
            return ["htmx/listing_list.html"]               # <-- Add this line
        return super().get_template_names()    


class ListingDetailView(UserIsAuthenticatedMixin, UserIsCreatorMixin, DetailView):
    model = Listing
    template_name = "jeonse/listing_detail.html"


class ListingCreateView(UserIsAuthenticatedMixin, CreateView):
    model = Listing
    form_class = ListingForm
    template_name = "jeonse/listing_create.html"
    success_url = reverse_lazy("listing_list")

    def form_valid(self, form):
        form.instance.creator = self.request.user
        return super().form_valid(form)