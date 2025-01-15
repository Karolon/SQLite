CREATE TABLE RokAkademicki ( 
	IdRokAkademicki char(7)  ,
	Data_rozp date ,
	Data_zak date ) ;
/* StudentGrupa.*/  
CREATE TABLE StudentGrupa (
  	Id Integer  ,
	IdOsoba int ,
	IdGrupa int );

/* Grupa.*/  
CREATE TABLE Grupa (
	IdGrupa Int Identity  ,
	NrGrupy char(10) ,
	SemestrNauki int ,
	IdRokAkademicki char(7) );

/* PrzedmiotPoprzedzajacy.*/  
CREATE TABLE PrzedmiotPoprzedzajacy (
  	Id Integer  ,
	IdPoprzednik int ,
	IdPrzedmiot int );

/* Przedmiot.*/  
CREATE TABLE Przedmiot ( 
	IdPrzedmiot int identity  ,
	Przedmiot varchar(128) ,
	Symbol char(3)
	);

/* StopnieTytuly.*/  
CREATE TABLE StopnieTytuly ( 
	IdStopien int identity  ,
	Stopien varchar(32) ,
	Skrot varchar(16) );

/* Ocena.*/  
CREATE TABLE Ocena (
  	Id Integer  ,
	IdStudent int ,
	IdPrzedmiot int ,
	DataWystawienia date ,
	IdDydaktyk int ,
	Ocena decimal(2,1) );

/* Panstwo.*/  
CREATE TABLE Panstwo ( 
	IdPanstwo int identity  ,
	Panstwo varchar(64) );

/* Osoba.*/  
CREATE TABLE Osoba ( 
	IdOsoba int identity  ,
	Nazwisko varchar(62) ,
	Imie varchar(32) ,
	DataUrodzenia date 
	);

/* Student.*/  
CREATE TABLE Student ( 
	IdOsoba int  ,
	NrIndeksu char(10) ,
	DataRekrutacji date );

/* Dydaktyk.*/  
CREATE TABLE Dydaktyk ( 
	IdOsoba int  
	,IdStopien int 
	,Podlega int 
	);
 
 INSERT INTO RokAkademicki (IdRokAkademicki, Data_rozp, Data_zak)
VALUES ('2011_12', '2011-10-01', '2012-08-31'),
		('2012_13', '2012-10-01', '2013-08-31'),
		('2013_14', '2013-10-01', '2014-08-31'),
		('2014_15', '2014-10-01', '2015-08-31');
-------------------------------------------------------------------------------
INSERT INTO Grupa (NrGrupy, SemestrNauki, IdRokAkademicki)
VALUES ('WIs I.1', 1, '2011_12'),
		('WIs I.2', 1, '2011_12'),
		('WIs II.1', 2, '2011_12'),
		('WIs II.2', 2, '2011_12'),

		('WIs I.1', 1, '2012_13'),
		('WIs I.2', 1, '2012_13'),
		('WIs II.1', 2, '2012_13'),
		('WIs II.2', 2, '2012_13'),
		('WIs III.1', 3, '2012_13'),
		('WIs III.2', 3, '2012_13'),
		('WIs IV.1', 4, '2012_13'),
		('WIs IV.2', 4, '2012_13'),

		('WIs I.1', 1, '2013_14'),
		('WIs I.2', 1, '2013_14'),
		('WIs II.1', 2, '2013_14'),
		('WIs II.2', 2, '2013_14'),
		('WIs III.1', 3, '2013_14'),
		('WIs III.2', 3, '2013_14'),
		('WIs IV.1', 4, '2013_14'),
		('WIs IV.2', 4, '2013_14'),
		('WIs V.1', 5, '2013_14'),
		('WIs VI.1', 6, '2013_14'),

		('WIs I.1', 1, '2014_15'),
		('WIs I.2', 1, '2014_15'),
		('WIs II.1', 2, '2014_15'),
		('WIs II.2', 2, '2014_15');
-------------------------------------------------------------------------------



INSERT INTO Przedmiot (IdPrzedmiot, Przedmiot, Symbol)
VALUES	(1,'Systemy baz danych', 'SBD'),
		(2,'Relacyjne bazy danych', 'RBD'),
		(3,'Algebra liniowa i geometria', 'ALG'),
		(4,'Matematyka dyskretna', 'MAD'),
		(5,'Systemy operacyjne', 'SOP'),
		(6,'Analiza matematyczna I', 'AM1'),
		(7,'Inżynieria oprogramowania', 'INO'),
		(8,'Projektowanie baz danych', 'BDA'),
		(9,'Administrowanie bazą danych', 'ADM'),
		(10,'Analiza matematyczna II', 'AM2'),
		(11,'Alrytmy i struktury danych', 'ASD'),
		(12,'Administracja systemów operacyjnych', 'ASO');


INSERT INTO PrzedmiotPoprzedzajacy (IdPoprzednik, IdPrzedmiot)
VALUES (2,1),(3,4), (6, 10), (4, 11), (5,12);

-------------------------------------------------------------------------------
INSERT INTO StopnieTytuly (IdStopien, Skrot, Stopien)
VALUES	(1, 'Prof. Dr hab.', 'Profesor Doktor habilitowany')
		,(2, 'Dr hab.', 'Doktor habilitowany')
		,(3, 'Dr', 'Doktor')
		,(4, 'Mgr', 'Magister')
		,(5, 'Inż', 'Inżynier');


-------------------------------------------------------------------------------
INSERT INTO Panstwo (IdPanstwo, Panstwo)
VALUES (14, 'Białoruś'),
		(4, 'Czechy'),
		(15, 'Francja'),
		(10, 'Niemcy'),
		(3,	'Polska'),
		(12, 'Rosja'),
		(18, 'Rumunia'),
		(11, 'Słowacja'),
		(16, 'Słowenia'),
		(13, 'Ukraina'),
		(2, 'USA'),
		(19,'Hiszpania'),
		(23,'Turcja'),
		(21,'Finlandia'),
		(22,'Wlochy'),
		(24, 'Grecja');



--Dydaktycy------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES
(1,
 'Apolinary',
 'Anyżek',
'1960-12-01'
);

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(1 ,1);
-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (2, 'Balbina', 'Bakłażan', '1991-02-03');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(2,4);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (3, 'Baltazar', 'Bis','1995-09-04');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(3,5);


-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (4, 'Cezary', 'Czosnek', '1958-11-11');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(4, 1);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (5, 'Domicella', 'Dynia', '1982-06-30');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(5 ,3);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (6, 'Bazyli', 'Brokuł', '1971-03-08');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(6,2);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (7, 'Kajetan', 'Kalafior', '1989-05-03');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(7,4);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (8, 'Kunegunda', 'Karp', '1995-10-21');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(8,5);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (9, 'January', 'Jajecznica', '1965-05-22');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(9,2);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (10, 'Archibald', 'Agrest', '1978-09-05');
	
INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(10,3);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko,
 DataUrodzenia
)
VALUES (11, 'Kleofas', 'Klops', '1977-11-11');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(11, 4);

-----------------------------------------------------------------------------------------------
INSERT INTO osoba
(IdOsoba,
 Imie,
 Nazwisko
)
VALUES (23, 'Winicjusz', 'Wężymord');

INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(23, NULL);

-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--Studenci
-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (12,'Alberta', 'Ananas', '1991-03-05');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)	
VALUES	(12, '2011-09-12','s2121');
INSERT	INTO Dydaktyk (IdOsoba, IdStopien)
VALUES	(12, 5);

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (13, 'Salomea', 'Œliwka', '1992-05-15');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(13, '2011-09-13','s2126');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (14, 'Pulchernia', 'Pączek', '1993-08-14');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(14, '2011-08-19','s2101');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (15, 'Gryzelda', 'Gruszka', '1990-12-24');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(15, '2011-10-01','s2135');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (16, 'Tymoteusz', 'Tymianek', '1993-11-21');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(16, '2012-08-12','s3162');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (17, 'Klara', 'Koperek', '1994-03-22');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(17, '2012-09-23','s3177');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (18, 'Melchior', 'Melon', '1995-08-09');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(18, '2012-07-22','s3045');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (19, 'Hieronim', 'Kapusta', '1994-08-09');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(19, '2013-08-05','s4120');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (20, 'Brunchilda', 'Banan', '1995-07-07');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(20, '2013-07-16','s4022');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (21, 'Salomon', 'Seler', '1994-11-05');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(21, '2013-07-06','s4004');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (22, 'Bonifacy', 'Bób', '1996-03-09');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(22, '2013-09-22','s4321');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (24, 'Pafnucy', 'Papryka', '1997-02-19');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(24, '2013-09-22','s4322');

-----------------------------------------------------------------------------------------------
INSERT	INTO osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia) VALUES (25, 'Pankracy', 'Por', '1995-07-09');

INSERT	INTO Student (IdOsoba, DataRekrutacji, NrIndeksu)
VALUES	(25, '2013-09-22','s4323');

-----------------------------------------------------------------------------------------------
INSERT INTO Osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia)
VALUES (26, 'Cecylia', 'Cebula', '1997-12-02');

INSERT INTO Student (Idosoba, NrIndeksu, DataRekrutacji)
VALUES (26, 5122, '2014-06-11');

-----------------------------------------------------------------------------------------------
INSERT INTO Osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia)
VALUES (27, 'Dezydery', 'Dąb', '1998-01-22');

INSERT INTO Student (Idosoba, NrIndeksu, DataRekrutacji)
VALUES (27, 5131, '2014-07-17');

-----------------------------------------------------------------------------------------------
INSERT INTO Osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia)
VALUES (28, 'Konstancja', 'Koperek', '1996-02-02');

INSERT INTO Student (Idosoba, NrIndeksu, DataRekrutacji)
VALUES (28, 5138, '2014-07-22');

-----------------------------------------------------------------------------------------------
INSERT INTO Osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia)
VALUES (29, 'Judyta', 'Jarmuż', '1997-08-28');

INSERT INTO Student (Idosoba, NrIndeksu, DataRekrutacji)
VALUES (29, 5141, '2014-08-12');

-----------------------------------------------------------------------------------------------
INSERT INTO Osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia)
VALUES (30, 'Klaudiusz', 'Karczoch', '1996-09-06');

INSERT INTO Student (Idosoba, NrIndeksu, DataRekrutacji)
VALUES (30, 5144, '2014-08-22');

-----------------------------------------------------------------------------------------------
INSERT INTO Osoba (IdOsoba, Imie, Nazwisko, DataUrodzenia)
VALUES (31, 'Sykstus', 'Szczaw', '1997-10-05');

INSERT INTO Student (Idosoba, NrIndeksu, DataRekrutacji)
VALUES (31, 5149, '2014-09-01');


-----------------------------------------------------------------------------------------------
-----------------Studenci w grupach----------------------------------------------------------
-----------------------------------------------------------------------------------------------
INSERT INTO StudentGrupa (IdOsoba, IdGrupa)
VALUES (12, 1), (12, 3), (12,9), (12, 11), (12,21), (12, 22), (13, 1), (13, 3), (13,9), (13, 11), (13,21), (13, 22),
		(14, 1), (14, 3), (14,9), (14, 11), (14,21), (14, 22), (15, 1), (15, 3), (15,9), (15, 11), (15,21), (15, 22),
		(16, 5), (17, 5), (18, 5), (16, 7), (17, 7), (18, 7),(16, 17), (17, 17), (18, 17), (16, 19), (17, 19), (18, 19),
		(19,13), (20,13), (21,13), (22, 14), (24, 14), (25,14), (19,15), (20, 15), (21,15), (22, 16), (24, 16), (25, 16), 
		(26, 23), (27,23), (28, 23), (29, 24), (30, 24),(31, 24), (26, 25), (27, 25), (28, 25), (29, 26),(30, 26), (31, 26);
-----------------------------------------------------------------------------------------------
-----------------Oceny-------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
INSERT	INTO Ocena (IdStudent, IdPrzedmiot, DataWystawienia, Ocena, IdDydaktyk)
VALUES (12, 6, '2012-01-20', 4.0, 1),
		(13, 6, '2012-01-20', 4.5, 1),
		(14, 6, '2012-01-20', 3.0, 1),
		(15, 6, '2012-01-20', 5.0, 1),

		(16, 6, '2013-01-25', 2.0, 1),
		(17, 6, '2013-01-25', 4.5, 1),
		(18, 6, '2013-01-25', 3.0, 1),
		(16, 6, '2013-02-02', 3.0, 1),

		(19, 6, '2014-01-18', 5.0, 1),
		(20, 6, '2014-01-18', 4.0, 1),
		(21, 6, '2014-01-18', 4.5, 1),
		(22, 6, '2014-01-18', 2.0, 1),
		(22, 6, '2014-01-30', 4.0, 1),

		(12, 2, '2012-01-22', 5.0, 9),
		(13, 2, '2012-01-22', 4.5, 9),
		(14, 2, '2012-01-22', 4.0, 9),
		(15, 2, '2012-01-22', 5.0, 9),

		(16, 2, '2013-01-23', 5.0, 9),
		(17, 2, '2013-01-23', 4.5, 9),
		(18, 2, '2013-01-23', 2.0, 9),
		(18, 2, '2013-02-01', 3.0, 9),

		(19, 2, '2014-01-18', 3.0, 9),
		(20, 2, '2014-01-18', 4.0, 9),
		(21, 2, '2014-01-18', 3.5, 9),
		(22, 2, '2014-01-18', 5.0, 9),

		(12, 12, '2014-01-18', 4.0, 8),
		(13, 12, '2014-01-18', 4.5, 8),
		(14, 12, '2014-01-18', 4.0, 8),
		(15, 12, '2014-01-18', 3.0, 8);

