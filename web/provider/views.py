# Create your views here.
from django.contrib import messages
from django.shortcuts import render, redirect
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger

from .models import *


# Will be the page to start searches from
def index(request):
    # search page
    return render(request, "provider/index.html")

# Page for search results
def search(request):
    # convert all values into upper case, ignore empty values
    args = {k:str(v).strip("[]\'").upper() for k,v in dict(request.GET).items() if v != [''] and k not in {'csrfmiddlewaretoken', 'page', 'order_by'}}
    if len(args) == 0:
        messages.error(request, 'Please enter search parameters.')
        return redirect('index')
    # unpack the arguments and pass into the filter
    page = request.GET.get('page', 1)
    result = CoreNpi.objects.filter(**args).order_by(request.GET.get('order_by', 'last_name'), 'last_name', 'first_name', 'npi', 'description')
    paginator = Paginator(result, 50)
    # render results
    try:
        result = paginator.page(page)
    except PageNotAnInteger:
        result = paginator.page(1)
    except EmptyPage:
        result = paginator.page(paginator.num_pages)


    # Get the index of the current page
    index = result.number - 1  # edited to something easier without index
    # This value is maximum index of your pages, so the last page - 1
    max_index = len(paginator.page_range)
    # You want a range of 7, so lets calculate where to slice the list
    start_index = index - 3 if index >= 3 else 0
    end_index = index + 3 if index <= max_index - 3 else max_index

    total_pages = paginator.num_pages
    # Get our new page range. In the latest versions of Django page_range returns
    # an iterator. Thus pass it to list, to make our slice possible again.
    page_range = list(paginator.page_range)[start_index:end_index]

    context = {'result': result, 'page_range': page_range, 'start_index': start_index,
               'end_index':end_index, 'total_pages': total_pages}
    return render(request, 'provider/search.html', context=context)

def npi(request, id):
    core = None
    fullnpi = None
    try:
        core = CoreNpi.objects.get(id=id)
    except CoreNpi.DoesNotExist:
        pass
    if core:
        fullnpi = Npi.objects.get(npi=core.npi)
    return render(request, 'provider/npi.html', context={'fullnpi': fullnpi, 'core': core})


