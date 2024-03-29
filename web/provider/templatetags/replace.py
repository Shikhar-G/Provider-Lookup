from django import template
from urllib.parse import urlencode
from collections import OrderedDict
import re
import phonenumbers

register = template.Library()


# from https://stackoverflow.com/questions/44048156/django-filter-use-paginations
@register.simple_tag
def relative_url(value, field_name, urlencode=None):
    url = "?{}={}".format(field_name, value)
    if urlencode:
        querystring = urlencode.split("&")
        filtered_querystring = filter(
            lambda p: p.split("=")[0] != field_name, querystring
        )
        encoded_querystring = "&".join(filtered_querystring)
        url = "{}&{}".format(url, encoded_querystring)
    return url


# from https://stackoverflow.com/questions/2272370/sortable-table-columns-in-django
@register.simple_tag
def url_replace(request, field, value, direction=""):
    dict_ = request.GET.copy()

    if field == "order_by" and field in dict_.keys():
        if dict_[field].startswith("-") and dict_[field].lstrip("-") == value:
            dict_[field] = value
        elif dict_[field].lstrip("-") == value:
            dict_[field] = "-" + value
        else:
            dict_[field] = direction + value
    else:
        dict_[field] = direction + value

    return urlencode(OrderedDict(sorted(dict_.items())))


@register.simple_tag
def replace_addr(value):
    # replace all non-alphanumeric characters with nothing but keep spaces and replace spaces with +
    return re.sub("[^0-9a-zA-Z\s]+", "", value).replace(" ", "+")


@register.simple_tag
def replace_phone(value):
    return str(
        phonenumbers.format_number(
            phonenumbers.parse(value, "US"), phonenumbers.PhoneNumberFormat.NATIONAL
        )
    )
