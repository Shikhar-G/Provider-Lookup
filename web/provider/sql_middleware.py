"""
Gist code by vstoykov, gist link:
https://gist.github.com/vstoykov/1390853/5d2e8fac3ca2b2ada8c7de2fb70c021e50927375

Guide from:
https://levelup.gitconnected.com/django-sql-debugging-with-an-sql-log-middleware-optimising-django-part-1-ca3b5c20d892

Changes:
Removed terminal width function and only left basic printing of number of queries and time
"""

from django.db import connection
from django.conf import settings
import os


def SqlPrintingMiddleware(get_response):
    def middleware(request):
        response = get_response(request)
        # Return if there are no queries
        if not settings.DEBUG or len(connection.queries) == 0:
            return response

        # Print how many queries and calculate total time
        print("\n\n\033[1;35m[SQL Queries for]\033[1;34m %s\033[0m\n" % (request.path_info))
        total_time = 0.0
        for query in connection.queries:
            total_time = total_time + float(query['time'])

        # Display information
        print("\033[1;32m[TOTAL TIME: %s seconds]\033[0m" % str(total_time))
        print("\033[1;32m[TOTAL QUERIES: %s]\033[0m" % (len(connection.queries)))
        return response

    return middleware
