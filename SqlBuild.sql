drop table Stop;
drop table Flight;
drop table Route;
drop table Airport;
drop table Airline;
drop table City;
drop table Country;

create table Country(
	ID			int			NOT NULL	IDENTITY(0,1),
	Name		nvarchar(255),
	primary key (ID)
)

create table City(
	ID			int			NOT NULL	IDENTITY(0,1),
	Name		nvarchar(255),
	Country_ID	int			NOT NULL,
	primary key (ID),
	foreign key (Country_ID) REFERENCES Country(ID) 
)

create table Airport(
	IATA		char(3)		NOT NULL,
	Name		nvarchar(255),
	City_ID		int			NOT NULL,
	primary key (IATA),
	foreign key (City_ID) REFERENCES City(ID),
)

create table AirLine(
	ID			int			NOT NULL	IDENTITY(0,1),
	Name		nvarchar(255),
	primary key (ID),
)

create table Route(
	ID			int			NOT NULL	IDENTITY(0,1),
	Origin		char(3)		NOT NULL,
	Destination	char(3)		NOT NULL,
	Distance	int,
	primary key (ID),
	foreign key (Origin) REFERENCES Airport(IATA),
	foreign key (Destination) REFERENCES Airport(IATA),
)

create table Stop(
	Route_ID	int		NOT NULL,
	Airport		char(3)	NOT NULL,
	primary key (Route_ID,Airport),
	foreign key (Route_ID) REFERENCES Route(ID),
	foreign key (Airport) REFERENCES Airport(IATA),
)

create table Flight(
	ID			int		NOT NULL IDENTITY(0,1),
	Route_ID	int		NOT NULL,
	AirlineOwner	int,
	AirlineUser		int,
	primary key (ID),
	foreign key (Route_ID) REFERENCES Route(ID),
	foreign key (AirlineOwner) REFERENCES AirLine(ID),
	foreign key (AirlineUser) REFERENCES AirLine(ID),
)

insert into Country(Name) VALUES ('Denmark')
insert into Country(Name) VALUES ('United Kingdom')
insert into Country(Name) VALUES ('Morocco')
insert into Country(Name) VALUES ('Norway')
insert into Country(Name) VALUES ('Spain')
insert into Country(Name) VALUES ('Jordan')
insert into Country(Name) VALUES ('Netherlands')
insert into Country(Name) VALUES ('France')
insert into Country(Name) VALUES ('Italy')
insert into Country(Name) VALUES ('China')
insert into Country(Name) VALUES ('Qatar')
insert into Country(Name) VALUES ('United States')

insert into city(name, Country_ID) VALUES ('Copenhagen',0) -- CPH
insert into City(name,Country_ID) VALUES ('Ronne',0)--RNN, Ronne Airport,Danish Air, 146 km
insert into City(name,Country_ID) VALUES ('London',1)--LTN, Luton Airport, Ryanair, 953 km
insert into City(name,Country_ID) VALUES ('Agadir',2)--AGA, Al Massira Airport, Norwegian Air International - Norwegian Air Shuttle, 3.322 km
insert into City(name,Country_ID) VALUES ('Oslo',3)--OSL, Gardermoen Airport, SAS/Norwegian Air Shuttle - Norwegian Air Sweden, 520 km
insert into City(name,Country_ID) VALUES ('Madrid',4)-- MAD, Adolfo Suarez-Barajas Airport, Ryanair , 2.071 km 
insert into City(name,Country_ID) VALUES ('Amman',5) -- amm, Queen Alia International Airport, Royal Jordanian , 3.236 km
insert into City(name,Country_ID) VALUES ('Amsterdam',6)-- AMS, Schiphol Airport, SAS - Regional Jet, 636 km
insert into City(name,Country_ID) VALUES ('Paris',7)-- CDG, Charles de Gaulle Airport, Air France, 1.009 km 
insert into City(name,Country_ID) VALUES ('Pisa',8)-- PSA, Galileo Galilei Airport, SAS - Cityjet, 1.344 km
insert into City(name,Country_ID) VALUES ('Shanghai',9)--pvg, Pudong International Airport, SAS, 8.320 km
insert into City(name,Country_ID) VALUES ('Doha',10) -- DOH, Hamad International Airport, Qatar Airways, 4.635 km
insert into City(name,Country_ID) VALUES ('Los Angeles',11) --LAX, Los Angeles International Airport, SAS, 9.078 km	

insert into Airport(IATA,Name,City_ID) VALUES ('CPH','Kastrup Airport', 12)
insert into Airport(IATA,Name,City_ID) VALUES ('RNN','Ronne Airport,Danish Air', 0)
insert into Airport(IATA,Name,City_ID) VALUES ('LTN','Luton Airport, Ryanair',1)
insert into Airport(IATA,Name,City_ID) VALUES ('AGA','Al Massira Airport', 2)
insert into Airport(IATA,Name,City_ID) VALUES ('OSL','Gardermoen Airport', 3)
insert into Airport(IATA,Name,City_ID) VALUES ('MAD','Adolfo Suarez-Barajas Airport', 4)
insert into Airport(IATA,Name,City_ID) VALUES ('AMM','Queen Alia International Airport', 5)
insert into Airport(IATA,Name,City_ID) VALUES ('AMS','Schiphol Airport', 6)
insert into Airport(IATA,Name,City_ID) VALUES ('CDG','Charles de Gaulle Airport', 7)
insert into Airport(IATA,Name,City_ID) VALUES ('PSA','Galileo Galilei Airport', 8)
insert into Airport(IATA,Name,City_ID) VALUES ('PVG','Pudong International Airport', 9)
insert into Airport(IATA,Name,City_ID) VALUES ('DOH','Hamad International Airport', 10)
insert into Airport(IATA,Name,City_ID) VALUES ('LAX','Los Angeles International Airport', 11)

insert into AirLine(Name) Values ('Danish Air')
insert into AirLine(Name) Values ('Ryanair')
insert into AirLine(Name) Values ('Norwegian Air International')
insert into AirLine(Name) Values ('Norwegian Air Shuttle')
insert into AirLine(Name) Values ('SAS')
insert into AirLine(Name) Values ('Norwegian Air Sweden')
insert into AirLine(Name) Values ('Royal Jordanian')
insert into AirLine(Name) Values ('Regional Jet')
insert into AirLine(Name) Values ('Air France')
insert into AirLine(Name) Values ('Cityjet')
insert into AirLine(Name) Values ('Qatar Airways')

insert into Route(Origin,Destination,Distance) Values ('CPH','RNN', 146)
insert into Route(Origin,Destination,Distance) Values ('CPH','LTN',953)
insert into Route(Origin,Destination,Distance) Values ('CPH','AGA',3322)
insert into Route(Origin,Destination,Distance) Values ('CPH','OSL',520)
insert into Route(Origin,Destination,Distance) Values ('CPH','MAD',2071)
insert into Route(Origin,Destination,Distance) Values ('CPH','AMM',3236)
insert into Route(Origin,Destination,Distance) Values ('CPH','AMS',636)
insert into Route(Origin,Destination,Distance) Values ('CPH','CDG',1009)
insert into Route(Origin,Destination,Distance) Values ('CPH','PSA',1344)
insert into Route(Origin,Destination,Distance) Values ('CPH','PVG',8320)
insert into Route(Origin,Destination,Distance) Values ('CPH','DOH',4635)
insert into Route(Origin,Destination,Distance) Values ('CPH','LAX',9078)

insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (0,0,0)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (1,1,1)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (2,2,3)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (3,4,4)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (3,3,5)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (4,1,1)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (5,6,6)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (6,4,7)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (7,8,8)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (8,4,9)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (9,4,4)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (10,10,10)
insert into Flight(Route_ID,AirlineOwner,AirlineUser) VALUES (11,4,4)