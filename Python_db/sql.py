import sqlite3 as sql

conn = sql.connect('sql.db')
cursor = conn.cursor()

'''cursor.execute('SELECT imie FROM Osoba')
x = cursor.fetchall()
print(x)
'''
cmd1 = 'create table k2a (id int, imie text, nazwisko text)'
cmd2 = 'insert into k2a values(?, ?, ?);'
people = [(1, 'Maks', 'Ciuchta'),
          (2, 'Olek', 'Kaczmarek'),
          (3, 'Janek', 'Kręcielewki'),
          (4, 'Mati', 'Kuba'),
          (5, 'Michał', 'Kerschke'),
          (6, 'Karol', 'Jezioro'),
          (7, 'Tomek', 'Libiszewski'),
          (8, 'Tatiana', 'Zimna')]
#cursor.execute(cmd1)
cursor.executemany(cmd2, people)
conn.commit()
