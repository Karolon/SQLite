select imie, nazwisko, dataurodzenia from osoba

--4
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko
)
VALUES (420, 'Max', 'Neumann-Wolszakiewicz');
INSERT	INTO Dydaktyk (IdOsoba)
VALUES	(420);

--6
alter table Osoba add column ilość_posiadanych_zwierzakow int

--1
SELECT imie || ' ' || nazwisko as 'Dane personalne' from osoba
--2
select imie, nazwisko, from osoba o inner join student s on o.IdOsoba = s.IdOsoba
from student s inner join dydaktyk d on s.IdOsoba = d.IdOsoba
select ocena from Ocena oc inner join osoba o on oc.IdStudent = o.IdOsoba
--3
select przedmiot from przedmiot where przedmiot like 'A%'
Union
select przedmiot from przedmiot where przedmiot like 'E%'--niedzila
Union
select przedmiot from przedmiot where przedmiot like 'I%'
Union
select przedmiot from przedmiot where przedmiot like 'O%'
Union
select przedmiot from przedmiot where przedmiot like 'U%'
Union
select przedmiot from przedmiot where przedmiot like 'Y%'

--7
select imie, nazwisko, round(avg(Ocena),2) from osoba o inner join student s on o.IdOsoba = s.IdOsoba
--9
create table oceny(data date, oceny int)
insert into oceny ( oceny, data) values('2012', 8), ('2013', 8), ('2014', 13);
select oceny, data from oceny
/*
2012: 8
2013: 8
2014: 13
*/



