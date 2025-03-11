import sqlite3 as sql

conn = sql.connect('')
cursor = conn.cursor()

cursor.execute('SELECT table_name FROM dba_tables;')
x = cursor.fetchall()
print(x)

