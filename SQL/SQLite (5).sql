
--1.1
SELECT Przedmiot, symbol from Przedmiot;
--1.2
SELECT * from StopnieTytuly;
--1.3
SELECT * FROM Grupa;
--1.4
SELECT * from Osoba ORDER BY dataurodzenia DESC;
--1.5
SELECT imie || ' ' || nazwisko as "Pracownicy i studenci" FROM Osoba ORDER by nazwisko;
--1.6
--student lub dydaktyk
--1.7
SELECT DISTINCT imie from Osoba ORDER by imie;
--1.8
SELECT DISTINCT substr(datarekrutacji,0,4) FROM Student;


--2.1
SELECT imie FROM Osoba WHERE nazwisko LIKE 'K%';
--2.2
SELECT nazwisko FROM Osoba WHERE imie LIKE '%A%' and imie NOT LIKE '%B%';
--2.3
SELECT imie, nazwisko from Osoba WHERE length(imie) = 5;
--2.4 
SELECT * FROM Osoba WHERE dataurodzenia notNULL;
--2.5
SELECT * FROM Osoba WHERE dataurodzenia is NULL;


--3.1
SELECT * FROM Osoba o , Student s WHERE o.IdOsoba == s.IdOsoba;
SELECT imie, nazwisko FROM Osoba INNER JOIN Student on Osoba.IdOsoba = Student.IdOsoba;
--3.2
SELECT imie, nazwisko FROM Osoba INNER JOIN Dydaktyk on Osoba.IdOsoba = Dydaktyk.IdOsoba;
--3.3
SELECT imie, nazwisko FROM Osoba INNER JOIN Dydaktyk on Osoba.IdOsoba = Dydaktyk.IdOsoba INNER JOIN Student on Osoba.IdOsoba = Student.IdOsoba;
--3.4
SELECT imie, nazwisko, datarekrutacji FROM Student inner JOIN Osoba on Student.IdOsoba = Osoba.IdOsoba 
WHERE datarekrutacji < '2012-09-30' and datarekrutacji > '2012-07-10';
--.3.5
SELECT imie, nazwisko FROM Osoba INNER JOIN Dydaktyk on Osoba.IdOsoba = Dydaktyk.IdOsoba WHERE idstopien isnull;
--.3.6
SELECT imie, nazwisko, stopien 
FROM Osoba INNER JOIN Dydaktyk on Osoba.IdOsoba = Dydaktyk.IdOsoba 
LEFT JOIN StopnieTytuly on StopnieTytuly.IdStopien = Dydaktyk.IdStopien WHERE podlega isnull;
--3.7
SELECT imie, nazwisko, stopien
FROM Osoba INNER JOIN Dydaktyk on Osoba.IdOsoba = Dydaktyk.IdOsoba INNER JOIN StopnieTytuly on StopnieTytuly.IdStopien = Dydaktyk.IdStopien 
where stopien LIKE '%doktor%'
--3.8
SELECT imie, nazwisko
FROM Osoba INNER JOIN Student on Osoba.IdOsoba = Student.IdOsoba 
INNER JOIN Ocena on Ocena.IdStudent = Student.IdOsoba 
INNER JOIN Przedmiot on Ocena.IdPrzedmiot = Przedmiot.IdPrzedmiot
where ocena = 2 and Przedmiot LIKE '%ana%'and datawystawienia LIKE '2013%';
--3.9
SELECT imie, nazwisko, stopien 
FROM Osoba INNER JOIN Dydaktyk on Osoba.IdOsoba = Dydaktyk.IdOsoba 
LEFT JOIN StopnieTytuly on StopnieTytuly.IdStopien = Dydaktyk.IdStopien;
--3.10
SELECT imie, nazwisko, IFNULL(stopien, 'Brak') as Stopien
FROM Osoba INNER JOIN Dydaktyk on Osoba.IdOsoba = Dydaktyk.IdOsoba 
LEFT JOIN StopnieTytuly on StopnieTytuly.IdStopien = Dydaktyk.IdStopien;
--3.11
SELECT DISTINCT Przedmiot
FROM Ocena iNNER JOIN Przedmiot on Ocena.IdPrzedmiot = Przedmiot.IdPrzedmiot
--3.12
SELECT imie, nazwisko, przedmiot, ocena
FROM Osoba INNER JOIN Student on Osoba.IdOsoba = Student.IdOsoba 
INNER JOIN Ocena on Ocena.IdStudent = Student.IdOsoba 
INNER JOIN Przedmiot on Ocena.IdPrzedmiot = Przedmiot.IdPrzedmiot
ORDER by  Przedmiot DESC, Ocena DESC
--3.13
SELECT o1.Imie, o1.Nazwisko, o2.Imie, o2.Nazwisko
FROM Dydaktyk d1 inner JOIN Osoba o1 on o1.IdOsoba = d1.IdOsoba
INNER JOIN Dydaktyk d2 on o1.IdOsoba = d2.Podlega
inner JOIN Osoba o2 on o2.IdOsoba = d2.IdOsoba
--3.14-
SELECT o1.Imie, o1.Nazwisko, ocena, przedmiot, o2.Imie as "Imie Dydaktyka", o2.Nazwisko as "Nazwisko dydaktyka"
FROM Osoba o1 inner JOIN Student s1 on o1.IdOsoba = s1.IdOsoba
INNER JOIN Ocena oc on o1.IdOsoba = oc.IdStudent
inner JOIN Przedmiot p on p.IdPrzedmiot = oc.IdPrzedmiot
INNER JOIN Osoba o2 on oc.IdDydaktyk = o2.IdOsoba
--3.15
SELECT o.Imie || ' ' || o.Nazwisko as "Imie i nazwisko", 'Dydaktyk' as "Rola w uczelni"
FROM Osoba o INNER JOIN Dydaktyk d on o.IdOsoba = d.IdOsoba
UNION
SELECT o.Imie || ' ' || o.Nazwisko as "Imie i nazwisko", 'Student' as "Rola w uczelni"
FROM Osoba o INNER JOIN Student s on o.IdOsoba = s.IdOsoba
ORDER by "Imie i nazwisko"
--3.16
SELECT imie, nazwisko
FROM Osoba o INNER JOIN Student s on o.IdOsoba = s.IdOsoba
INNER JOIN Dydaktyk d on o.IdOsoba = d.IdOsoba
--3.17
SELECT 'Pan ' || imie || ' ' || nazwisko as "Imie nazwisko"
FROM Osoba o INNER JOIN Student s on s.IdOsoba = o.IdOsoba
WHERE imie not LIKE '%a'
UNION
SELECT 'Pani ' || imie || ' ' || nazwisko
FROM Osoba o INNER JOIN Student s on s.IdOsoba = o.IdOsoba
WHERE imie LIKE '%a'
--3.18

SELECT imie, nazwisko, datarekrutacji
FROM Osoba o INNER JOIN Student s on s.IdOsoba = o.IdOsoba
WHERE nrindeksu in ('s3045', 's3162', 's3177');

--3.19
SELECT imie, nazwisko, datarekrutacji, nrindeksu
FROM Osoba o INNER JOIN Student s on s.IdOsoba = o.IdOsoba
WHERE imie like '%a' and (nazwisko like 'B%' or datarekrutacji LIKE '2012%')

--3.20
SELECT DISTINCT imie, nazwisko, p.Przedmiot, oc.Ocena
FROM Osoba o INNER JOIN Ocena oc on o.IdOsoba = oc.IdStudent
INNER JOIN Przedmiot p on oc.IdPrzedmiot = p.IdPrzedmiot
WHERE imie not like '%a' and p.Przedmiot LIKE '%admin%' notNULL and p.Przedmiot LIKE '%bazy%' notNULL ;

--3.21

SELECT DISTINCT imie, nazwisko, Przedmiot
FROM Osoba o INNER JOIN Ocena oc on o.IdOsoba = oc.IdStudent
INNER JOIN Przedmiot p on oc.IdPrzedmiot = p.IdPrzedmiot
WHERE p.Przedmiot LIKE '%admin%' notNULL and p.Przedmiot LIKE '%bazy%' like NULL;

--4.1
SELECT DISTINCT COUNT(*) as "Ilosc przedmiotów" from Przedmiot;

--4.2
SELECT COUNT(*)
from Student WHERE datarekrutacji LIKE '%2012%';

--4.3 
SELECT ROUND(AVG(ocena),2) as "AVERAGE", MAX(ocena) as 'MAX', MIN(ocena) as 'MIN' 
FROM Ocena o INNER JOIN Przedmiot p on o.IdPrzedmiot = p.IdPrzedmiot ;
WHERE p.Symbol like 'AM1'

--4.4
SELECT COUNT(Ocena), ROUND(AVG(Ocena),2), przedmiot
FROM Ocena o RIGHT JOIN Przedmiot p on o.IdPrzedmiot = p.IdPrzedmiot
GROUP by Przedmiot;

--4.5 
SELECT COUNT(ocena), ROUND(AVG(ocena),2), przedmiot, imie, nazwisko
FROM Ocena oc INNER JOIN Przedmiot p ON oc.IdPrzedmiot = p.IdPrzedmiot
INNER JOIN Osoba os on oc.IdStudent = os.IdOsoba
GROUP by imie, Przedmiot;

--4.6
SELECT COUNT(ocena) as 'ilosc', ROUND(AVG(ocena),2) as 'average', przedmiot, imie, nazwisko
FROM Ocena oc INNER JOIN Przedmiot p ON oc.IdPrzedmiot = p.IdPrzedmiot
INNER JOIN Osoba os on oc.IdStudent = os.IdOsoba
GROUP by imie, Przedmiot
HAVING ilosc < 2
ORDER by Przedmiot, average DESC

--4.7
SELECT przedmiot 
From Przedmiot p INNER JOIN Ocena oc on oc.IdPrzedmiot = p.IdPrzedmiot
WHERE ocena >= 3
GROUP by przedmiot
HAVING COUNT(Ocena) > 5

--4.8 imie, nazwisko, ilosc ocen pozytywnych
SELECT imie, nazwisko, COUNT(Ocena) as "Ilosc ocen pozytywnych"
FROM Osoba o INNER JOIN Ocena oc on oc.IdStudent = o.IdOsoba
WHERE Ocena > 2
GROUP by imie, nazwisko
LIMIT 2

--4.9 pierwsza litera imienia . nazwisko osobyu z najwiękrzą średnią
SELECT substr(imie,1,1) || '.' || nazwisko as login
from Osoba o INNER JOIN Ocena oc on o.IdOsoba = oc.IdStudent
GROUP by imie, nazwisko
ORDER by avg(Ocena) DESC
LIMIT 1

--4.10 podaj imie, nazwisko, nr idneksu studenta, który ma najniższa i najmniejszą średnią
SELECT imie, nazwisko, nrindeksu
from Osoba o INNER JOIN Ocena oc on o.IdOsoba = oc.IdStudent
INNER JOIN Student s on s.IdOsoba = o.IdOsoba
GROUP by imie, nazwisko
ORDER by avg(Ocena) DESC
LIMIT 1
UNION
SELECT imie, nazwisko, nrindeksu
from Osoba o INNER JOIN Ocena oc on o.IdOsoba = oc.IdStudent
INNER JOIN Student s on s.IdOsoba = o.IdOsoba
GROUP by imie, nazwisko
ORDER by avg(Ocena)
LIMIT 1

--5.1
SELECT imie, nazwisko
FROM Osoba o WHERE o.IdOsoba in (SELECT idosoba FROM Student) 

--5.2
SELECT DISTINCT przedmiot
FROM Przedmiot WHERE idprzedmiot in (SELECT idprzedmiot from Ocena)

--5.3
SELECT imie, nazwisko
FROM Osoba WHERE idosoba in (SELECT idosoba FROM Student WHERE datarekrutacji LIKE substr((SELECT datarekrutacji FROM Student WHERE idosoba in (SELECT idosoba FROM Osoba WHERE imie like 'alberta')),1,4) || '%')

--5.4
SELECT imie, nazwisko, nrindeksu
FROM Osoba WHERE idosoba in (SELECT idosoba FROM Student ORDER by datarekrutacji DESC LIMIT 1)

--5.5
SELECT imie, nazwisko
FROM Osoba WHERE idosoba in (SELECT idstudent from Ocena GROUP by idstudent HAVING avg(ocena) >
                             (SELECT avg(Ocena) FROM Ocena where idstudent in (SELECT idosoba FROM Osoba WHERE imie like 'hier%')))

--5.6
SELECT imie, nazwisko 
FROM Osoba WHERE idosoba in 
(SELECT idstudent from Ocena GROUP by idstudent HAVING avg(ocena) > 
(SELECT avg(Ocena) FROM Ocena where idstudent in (SELECT idosoba FROM Osoba WHERE nazwisko like 'anan%')))
and idosoba in (SELECT idosoba FROM Student WHERE datarekrutacji LIKE 
substr((SELECT datarekrutacji FROM Student WHERE idosoba in (SELECT idosoba FROM Osoba WHERE imie like 'gryz%')),1,4) || '%')

--5.7
SELECT imie, nazwisko
FROM Osoba where idosoba in 
(SELECT idstudent FROM Ocena GROUP by idstudent ORDER by avg(Ocena) desc LIMIT 1)

--6.1


