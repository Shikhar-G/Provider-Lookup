from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import Npi, Taxonomy, Addresses, CoreNpi, NpiTaxonomy

admin.site.register(Npi)
admin.site.register(Taxonomy)
admin.site.register(CoreNpi)
admin.site.register(NpiTaxonomy)
admin.site.register(Addresses)