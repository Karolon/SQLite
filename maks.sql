--sprawdzian
--1
select imie || ' ' || nazwisko as 'Dane Personalne' from Osoba o where dataurodzenia is not null

--2
select DISTINCT imie, nazwisko, count(Ocena) from osoba o inner join student s ON o.IdOsoba = s.IdOsoba
inner join Dydaktyk d on o.IdOsoba = d.IdOsoba inner join ocena oc on o.IdOsoba = oc.IdStudent

--3
select symbol from Przedmiot where symbol like 'A%' 
or symbol like'E%'
or symbol like'I%'
or symbol like'O%'
or symbol like'U%'
or symbol like'Y%'
order by symbol asc

--4
insert into osoba values (2137, 'Neuman-Wolszakiewicz', 'Max', null)

select * from osoba

--5
select imie, nazwisko, nrindeksu from osoba o
inner join student s on o.IdOsoba = s.IdOsoba WHERE
imie like '%A%' and imie not like '%C%' and imie not like '%D%'

--6
alter table osoba add column ilosc_posiadanych_zwierzakow(float)

--7
select count(ocena), avg(ocena), idPrzedmiot, imie, nazwisko from Ocena
inner join Przedmiot p on p.IdPrzedmiot Ocena.IdPrzedmiot
inner join osoba o on o.IdOsoba = Ocena.IdStudent

select nrindeksu from osoba o
inner join student s on o.IdOsoba = s.IdOsoba 
where avg(ocena)>avg(ocena)