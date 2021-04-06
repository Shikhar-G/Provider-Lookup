import psycopg2
import django

# Connect to your postgres DB
conn = psycopg2.connect("dbname=provider")

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a query
cur.execute("SELECT * FROM npi_taxonomy LIMIT 3;")

# Retrieve query results
records = cur.fetchall()
print(records)
print(django.get_version())