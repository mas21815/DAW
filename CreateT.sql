Create database Fabrica;

use Fabrica;

drop table Entities;
Create table Entities(

IdEntitie int identity(1,1),
name varchar(100),
IsProvider bit,
IsConsumer bit,
IsPerson bit,
CIF varchar(100) UNIQUE,
GCIF varchar(100) UNIQUE,

constraint pk_Entities_IdEntities Primary key (IdEntitie)
);

Create table States(

IdState int,
name varchar(100),

constraint pk_States_IdState Primary key (IdState)
);

create table Addresss (

IdAddress int,
CP int,
Address varchar(100),
IdState int,

constraint pk_Addresss_IdAddress Primary key (IdAddress),
constraint fk_Addresss_IdState foreign key (IdState) references States(IdState)
);

create table Locations (

IdEntitie int,
IdAddress int,

constraint pk_Addresss_IdAddress Primary key (IdEntitie,IdAddress),
constraint fk_Locations_IdEntitie foreign key (IdEntitie) references Entities(IdEntitie),
constraint fk_Locations_IdAddress foreign key (IdAddress) references Addresss(IdAddress)
);

create table Factories (

IdFactorie int,
name varchar(100),
description varchar(100),
IdAddress int,

constraint pk_Factories_IdFactorie Primary key (IdFactorie),
constraint fk_Factories_IdAddress foreign key (IdAddress) references Addresss(IdAddress)
);

create table Products (

IdProduct int,
name varchar(100),
description varchar(100),
Price varchar(100),

constraint pk_Products_IdProduct Primary key (IdProduct),
)

create table FactoriesProducts (

IdFactorie int,
IdProduct int,

constraint pk_FactoriesProducts_IdFactorieIdProduct Primary key (IdFactorie,IdProduct),
constraint fk_FactoriesProducts_IdFactorie foreign key (IdFactorie) references Factories(IdFactorie),
constraint fk_FactoriesProducts_IdProduct foreign key (IdProduct) references Products(IdProduct)
);

create table Invoices (

IdInvoice int,
Taxes decimal,
date DATE,

constraint pk_Invoices_IdInvoice Primary key (IdInvoice)
);

create table Lines (

IdInvoice int,
Number int,
discount decimal,
concept varchar(100),
unitCount int,
unitPrice decimal,
IdProduct int,

constraint pk_Lines_IdInvoiceNumber Primary key (IdInvoice,number),
constraint fk_Lines_IdInvoice foreign key (IdInvoice) references Invoices(IdInvoice)
);


create table Materials (

IdMaterial int,
name varchar(100),
description varchar(100),

constraint pk_Materials_IdMaterial Primary key (IdMaterial)

);

create table Provides(

IdEntitie int,
IdMaterial int,
Price varchar(100),

constraint pk_Provides_IdEntitieIdMaterial Primary key (IdEntitie,IdMaterial),
constraint fk_Provides_IdEntitie foreign key (IdEntitie) references Entities(IdEntitie),
constraint fk_Provides_IdMaterial foreign key (IdMaterial) references Materials(IdMaterial)
)

create table Phones (

Phone varchar(100),
IdEntitie int,

constraint pk_Phones_Phone Primary key (Phone),
constraint fk_Phones_IdEntitie foreign key (IdEntitie) references Entities(IdEntitie)
)

select * from Entities;