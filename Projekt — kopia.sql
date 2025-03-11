CREATE TABLE Users(
    `Id` INT NOT NULL PRIMARY KEY,
    `UserName` TEXT,
    `Email` TEXT,
    `PhoneNumber` INT,
    `Password` TEXT,
    `JoinDate` DATE
);
CREATE TABLE Friends(
    `IdUser` INT NOT NULL,
    `IdFriend` INT
);
CREATE TABLE Profile_Settings(
    `IdUser` INT NOT NULL PRIMARY KEY,
    `showedname` TEXT,
    `Pronouns` TEXT,
    `BannerColour` TEXT,
    `AbautMe` TEXT
);
CREATE TABLE Servers(
    `Id` INT NOT NULL PRIMARY KEY,
    `Name` TEXT,
    `IdOwner` TEXT,
    `CreateDate` DATE,
    `Level` INT
);
CREATE TABLE ServerMembers(
    `IdServer` INT NOT NULL,
    `IdUser` INT
);
CREATE TABLE Chat(
    `IdChat` INT NOT NULL PRIMARY KEY,
    `ChatName` TEXT,
    `Owner` INT
);
CREATE TABLE ChatMembers(
    `IdChat` INT NOT NULL,
    `IdUser` INT
);
CREATE TABLE ChatMessages(
    `IdMessage` INT NOT NULL PRIMARY KEY,
    `IdSender` INT,
    `IdChat` INT,
    `Message` TEXT,
    `SendDate` DATETIME
);
CREATE TABLE ServerChannels(
    `IdChannel` INT NOT NULL PRIMARY KEY,
    `IdServer` INT,
    `Name` TEXT,
    `Topic` TEXT,
    `Private` BOOLEAN
);

CREATE TABLE ServerMessages(
    `IdMessage` INT NOT NULL PRIMARY KEY,
    `IdChannel` INT,
    `IdSender` INT,
    `SendDate` DATETIME,
    `Message` TEXT
);

INSERT INTO Users VALUES (1,'Maks', 'maks@gmail.com', 48213456865,'we4rftguy671q35gy89', 2012-04-12),
                            (2,'Janke', 'janke@gmail.com', 49234532189,'12345ghqQR', 2022-11-10),
                            (3,'Marcel', 'marcel@op.pl', 48156723489,'3512GH3RQ', 2012-05-11),
                            (4,'Joanna', 'jk@gmail.com', 48189893159,'HASLO', 2012-06-03),
                            (5,'Zebra', 'zebra@gmail.com', 50489756123,'1234567890', 2012-12-25),
                            (6, 'Henry', 'henry@hotmail.com', 48567070029, '!6Ifp99w&L', 2011-08-15), 
                            (7, 'Zdzichu', 'zdzichy@gmail.com', 48672307726, 'tr+11VAidu', '
                            2017-02-19'), 
                            (8, 'Henryk', 'henryk@walezy.pl', 48746407968, 'LQ)0RCa&Cw', 2016-03-24), 
                            (9, 'Jan', 'kazimierz@op.pl', 659004487, '61Egcx%q&6', 2012-10-31), 
                            (10, 'Marcin', 'lewy@gmail.com', 48515527583, '(*B8Nod0_9', 2019-02-28);

INSERT INTO Friends VALUES (1,2), (1,3), (1,8), (2,5), (2,8), (3,4), (5,8), (8,10), (9,10);


INSERT INTO Profile_Settings VALUES (1,'Mamma_mia', NULL, '#921766', 'Dlaczego to miejsce ma tylko możliwych do wpisania 190 znaków, w tak małym miejscu dosłownie nic o osobie nie da się napisać, nawet jak się nie ma życia. Discord proszę cię bardzo rozszerz..'),
                                        (2,'Anime_Fan', 'er/sein', '#80e55a', 'I like trains'),
                                        (3,'Armata', NULL, '#c83219', NULL),
                                        (4,'Bóbr', 'she/her', '#070b73', 'I`d like to fill the cap of the 200 signs available in this space, unfortunately I won`t be able to fit in all my thoughts,  I am going to try, so firs- discord.gg/markett'),
                                        (5,'Hipopotam', NULL, '#8c76ce', 'To ja'), 
                                        (6, 'Zygrfryd', NULL, '#f73fa4', 'Dreamer and thinker.'), 
                                        (7, 'czolg', NULL, '#1a4991', 'NAPRZÓD!'), 
                                        (8, 'Trawa', 'he/him', '#bb4e34', NULL), 
                                        (9, 'Echologator2000', NULL, '#56451d', NULL), 
                                        (10, 'Bitwa', 'statek/łajba', '#9aa6d2', 'Okręt nasz wpłynął w mgłę i fregaty dwie popłynęły naszym kursem by nie zgubić się potem szkwał wypchnął nas poza mleczny pas i nikt wtedy nie przypuszczał że fregaty śmierć nam niosą');



INSERT INTO Servers VALUES (1, 'Wojna', 10, 2017-04-08, 0),
                            (2, 'Piwnica', 6, 2019-02-11, 2), 
                            (3, 'Złotko', 2, 2018-12-29, 0), 
                            (4, 'Raft', 5, 2024-04-23, 3), 
                            (5, 'Nazwa', 10, 2022-05-14, 1);

INSERT INTO ServerMembers VALUES  (1,1), (1,2), (1,8), (1,10), (2,4), (2,6), (2,7), (3,2), (3,7), (4,5), (4,8), (5,10), (5,2);

INSERT INTO Chat VALUES (1, 'Masownia', 1),
                            (2, 'dzięcioł', 8),
                            (3, 'pokuj spotkań', 3),
                            (4, 'gaming', 7),
                            (5, 'piwniczaki', 3);



INSERT INTO ChatMembers VALUES (1,1), (1,3), (2,4), (2,8), (3,3), (3,4), (4,2), (4,7), (5,1), (5,3), (5,8);

INSERT INTO ChatMessages VALUES (1, 4, 5, 'Witaj!', 2014-09-29), (2, 7, 4, 'Hej!', 2019-06-28), (3, 8, 5, 'Kiedy gramy?', 2016-03-09), (4, 7, 5, 'Oczywiście', 2012-01-15), (5, 1, 1, 'Dzięki', 2021-11-02), (6, 4, 2, 'Pomóżcie!', 2024-12-27), (7, 8, 3, 'Miło poznać!', 2016-09-11), (8, 9, 4, 'Witajcie', 2018-06-10), (9, 4, 3, 'Żaden problem', 2018-12-24), (10, 3, 2, '1998', 2016-09-21), (11, 3, 1, 'Ile masz lat?', 2015-06-25), (12, 5, 2, 'Makssssssssssssssssssssssssss coś ty zrobiłłłłłłłłłł?', 2022-03-07), (13, 4, 4, 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 2017-11-29), (14, 4, 1, 'Dowidzenia', 2012-08-07), (15, 1, 5, 'Żegnajcie', 2018-05-01), (16, 5, 1, 'Do zobaczenia w (PA)LOdówce', 2018-06-06);


INSERT INTO ServerChannels VALUES (1, 9, 'history', 'Gaming nights', True), (2, 10, 'memes', 'Daily discussions', False), (3, 42, 'travel', NULL, True), (4, 14, 'books', 'Nature lovers', True), (5, 37, 'random', 'Coding help', True);
 


INSERT INTO ServerMessages VALUES (1, 5, 8, 2024-02-23, 'Wszystko dobrze?'), (2, 1, 6, 2018-08-27, 'Supcio!'), (3, 3, 3, 20018-02-09, 'Potrzebuje przerwy'), (4, 4, 10, 2023-06-26, 'Wow!'), (5, 2, 4, 20016-12-02, 'Ale jazda!'), (6, 3, 8, 2019-02-24, 'Narka!'), (7, 3, 4, 20019-02-17, 'Everything is avesome'), (8, 2, 9, 2020-03-08, 'Do uszłyszenia'), (9, 2, 3, 2022-10-14, 'HAHAHAHAHAHAAAAA!'), (10, 4, 9, 2024-12-13, 'To ниэ йэст нaписaнэ пo руску');


--Wypisz nazwe, date stworzenia i poziom serverów
SELECT name, createdate, level from servers;
--Wypisz nazwe wszystkich użytkowników którzy dołączyli przes 1 stycznia 2020 roku
SELECT username from Users WHERE joindate < 2020-01-01;
--Wypisz wyświetlaną nazwe, nazwe użytkownika, oraz informacje o nim
SELECT showedname, UserName, abautme FROM users u INNER JOIN Profile_Settings p on u.Id == p.IdUser; 
--Wypisz nazwe serwera oraz ile ma członków
SELECT name, COUNT(iduser) FROM ServerMembers m INNER join servers s on m.IdServer = s.Id GROUP by idserver;
-- Wypisz nazwe serwera oraz nazwe użytkownika, który jest właścicielem
SELECT Name, username FROM Servers s inner join Users u on s.IdOwner = u.Id;