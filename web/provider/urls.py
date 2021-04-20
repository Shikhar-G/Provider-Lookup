from django.urls import path

from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('provider/search/', views.search, name='search'),
    path('provider/<int:id>/', views.npi, name='npi'),
]