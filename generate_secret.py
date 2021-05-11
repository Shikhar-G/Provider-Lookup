from django.core.management.utils import get_random_secret_key

f = open('web/.env', 'w').write(r"SECRET_KEY = '" + get_random_secret_key() + "'")