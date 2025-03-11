-- 1
SELECT imie || ' ' || nazwisko as "Dane personalne" FROM Osoba WHERE dataurodzenia notNULL;
--2
SELECT DISTINCT imie, nazwisko, COUNT(oc.ocena) as "ilosc ocen" from
Osoba o INNER JOIN Dydaktyk d on o.IdOsoba = d.IdOsoba
INNER JOIN Student s on s.idosoba = o.IdOsoba 
inner JOIN Ocena oc on oc.IdStudent GROUP by oc.IdStudent;

-- 3
SELECT Przedmiot from Przedmiot WHERE symbol LIKE 'a%' or symbol LIKE 'i%' or symbol LIKE 'o%' or symbol LIKE 'e%' or symbol LIKE 'u%' or symbol LIKE 'y%' ORDER by symbol;

--4
INSERT into Osoba VALUES (2137, 'Neuman-Wolszakiewicz', 'Max', NULL);
INSERT into Dydaktyk (idosoba)VALUES(2137);

--5
SELECT imie, nazwisko, nrindeksu FROM Osoba o INNER JOIN Student s on o.IdOsoba = s.IdOsoba WHERE imie LIKE '%A%' and imie NOT LIKE '%D%' and imie NOT LIKE '%C%';

--6
ALTER TABLE Osoba add COLUMN ilość_posiadanych_zwierzakow int;

--7
SELECT przedmiot, imie, nazwisko, COUNT(ocena), avg(ocena) 
from Osoba o INNER JOIN Student s on o.IdOsoba = s.IdOsoba
INNER JOIN Ocena oc on oc.IdStudent = o.IdOsoba 
INNER JOIN Przedmiot p on p.IdPrzedmiot = oc.IdPrzedmiot
GROUP by o.idosoba, p.IdPrzedmiot;

--8
SELECT nrindeksu from Student s INNER JOIN Ocena o on o.IdStudent = s.IdOsoba
GROUP by nrindeksu
HAVING avg(Ocena) > (SELECT avg(ocena) from Ocena o INNER JOIN Osoba os on os.IdOsoba = o.IdStudent where imie like 'Klara');

--9
SELECT COUNT(Ocena), substr(datawystawienia, 1,4) FROM Ocena GROUP by substr(datawystawienia, 1,4);