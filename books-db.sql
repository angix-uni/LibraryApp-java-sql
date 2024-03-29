﻿use master
go
Create table Ksiazka(
nrKsiazki int,
tytul varchar (50),
autor varchar (60),
rokWydania int,
wydawnictwo varchar (50));

use master
go
insert into Ksiazka values ('1','Potop','Henryk Sienkiewicz','2006','Wydawnictwo Greg'),
('2','Zbrodnia i kara','Fiodor Dostojewski','2006','Wydawnictwo Greg'), ('3','Skąpiec','Molier','2005','Wydawnictwo Greg'),
('4','Ferdydurke','Witold Gombrowicz','2012','Wydawnictwo Literackie'), ('5','Proces','Franz Kafka','2007','Wydawnictwo Greg'),
('6','Pani Bovary','Gustaw Flaubert','2017','Wydawnictwo Siedmioróg'), ('7','Mitologia nordycka','Neil Gaiman','2017','Wydawnictwo Mag'),
('8','Bieguni','Olga Tokarczuk','2015','Wydawnictwo Literackie'), ('9','Latarnik','Camilla Lackberg','2013','Wydawnictwo Czarna Owca'),
('10','Rok 1984','George Orwell','2013','Wydawnictwo MUZA S.A.')

use master
go
create procedure wyswietlKsiazka
as
begin
select * from Ksiazka
end
go
execute wyswietlKsiazka

use master
go
create procedure dodajKsiazka
@nrKsiazki int,
@tytul varchar(50),
@autor varchar(60),
@rokWydania int,
@wydawnictwo varchar(50)
as
begin
insert into Ksiazka (nrKsiazki,tytul,autor,rokWydania,wydawnictwo) values (@nrKsiazki,@tytul,@autor,@rokWydania,@wydawnictwo)
end
go

use master
go
create procedure tabelaCzyIstnieje
as
begin
    if not exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = 'Ksiazka')
    begin
        create table Ksiazka (
            nrKsiazki int,
			tytul varchar (50),
			autor varchar (60),
			rokWydania int,
			wydawnictwo varchar (50))
    end
end