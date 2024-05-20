<<<<<<< HEAD
/*
Created: 08.04.2024
Modified: 12.05.2024
Model: innovacii
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Dict_article

CREATE TABLE [Dict_article]
(
 [¹] Int NOT NULL,
 [Alf] Char(50) NOT NULL,
 [R] Int NOT NULL,
 [Content_rang] Varchar(128) NOT NULL,
 [Verb] Varchar(128) NOT NULL,
 [Part_of_speech] Varchar(64) NOT NULL
)
go

-- Add keys for table Dict_article

ALTER TABLE [Dict_article] ADD CONSTRAINT [PK_Dict_article] PRIMARY KEY ([¹])
go

-- Table Sposob

CREATE TABLE [Sposob]
(
 [Sposob_obraz] Varchar(50) NOT NULL,
 [Name_Sposob_obraz] Varchar(128) NOT NULL,
 [Meaning_Sposob_obraz] Text NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Sposob

ALTER TABLE [Sposob] ADD CONSTRAINT [PK_Sposob] PRIMARY KEY ([Sposob_obraz],[¹])
go

-- Table Example

CREATE TABLE [Example]
(
 [Age] Float NOT NULL,
 [Gender] Char(16) NOT NULL,
 [Meaning] Varchar(1024) NOT NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Example

ALTER TABLE [Example] ADD CONSTRAINT [PK_Example] PRIMARY KEY ([¹])
go

-- Table Vid

CREATE TABLE [Vid]
(
 [Vid_verb] Int NULL,
 [Content_vid_verb] Text NOT NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Vid

ALTER TABLE [Vid] ADD CONSTRAINT [PK_Vid] PRIMARY KEY ([¹])
go

-- Table Scheme_entity

CREATE TABLE [Scheme_entity]
(
 [Scheme] Varchar(1024) NOT NULL,
 [Analogy] Varchar(1024) NOT NULL,
 [Sposob_obraz] Varchar(50) NOT NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Scheme_entity

ALTER TABLE [Scheme_entity] ADD CONSTRAINT [PK_Scheme_entity] PRIMARY KEY ([Sposob_obraz],[¹])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE [Sposob] ADD CONSTRAINT [Article-Sposob] FOREIGN KEY ([¹]) REFERENCES [Dict_article] ([¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Example] ADD CONSTRAINT [Article-example] FOREIGN KEY ([¹]) REFERENCES [Dict_article] ([¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Vid] ADD CONSTRAINT [Article-Vid] FOREIGN KEY ([¹]) REFERENCES [Dict_article] ([¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Scheme_entity] ADD CONSTRAINT [Sposob-Scheme] FOREIGN KEY ([Sposob_obraz], [¹]) REFERENCES [Sposob] ([Sposob_obraz], [¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




=======
/*
Created: 08.04.2024
Modified: 12.05.2024
Model: innovacii
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Dict_article

CREATE TABLE [Dict_article]
(
 [¹] Int NOT NULL,
 [Alf] Char(50) NOT NULL,
 [R] Int NOT NULL,
 [Content_rang] Varchar(128) NOT NULL,
 [Verb] Varchar(128) NOT NULL,
 [Part_of_speech] Varchar(64) NOT NULL
)
go

-- Add keys for table Dict_article

ALTER TABLE [Dict_article] ADD CONSTRAINT [PK_Dict_article] PRIMARY KEY ([¹])
go

-- Table Sposob

CREATE TABLE [Sposob]
(
 [Sposob_obraz] Varchar(50) NOT NULL,
 [Name_Sposob_obraz] Varchar(128) NOT NULL,
 [Meaning_Sposob_obraz] Text NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Sposob

ALTER TABLE [Sposob] ADD CONSTRAINT [PK_Sposob] PRIMARY KEY ([Sposob_obraz],[¹])
go

-- Table Example

CREATE TABLE [Example]
(
 [Age] Float NOT NULL,
 [Gender] Char(16) NOT NULL,
 [Meaning] Varchar(1024) NOT NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Example

ALTER TABLE [Example] ADD CONSTRAINT [PK_Example] PRIMARY KEY ([¹])
go

-- Table Vid

CREATE TABLE [Vid]
(
 [Vid_verb] Int NULL,
 [Content_vid_verb] Text NOT NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Vid

ALTER TABLE [Vid] ADD CONSTRAINT [PK_Vid] PRIMARY KEY ([¹])
go

-- Table Scheme_entity

CREATE TABLE [Scheme_entity]
(
 [Scheme] Varchar(1024) NOT NULL,
 [Analogy] Varchar(1024) NOT NULL,
 [Sposob_obraz] Varchar(50) NOT NULL,
 [¹] Int NOT NULL
)
go

-- Add keys for table Scheme_entity

ALTER TABLE [Scheme_entity] ADD CONSTRAINT [PK_Scheme_entity] PRIMARY KEY ([Sposob_obraz],[¹])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 

ALTER TABLE [Sposob] ADD CONSTRAINT [Article-Sposob] FOREIGN KEY ([¹]) REFERENCES [Dict_article] ([¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Example] ADD CONSTRAINT [Article-example] FOREIGN KEY ([¹]) REFERENCES [Dict_article] ([¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Vid] ADD CONSTRAINT [Article-Vid] FOREIGN KEY ([¹]) REFERENCES [Dict_article] ([¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Scheme_entity] ADD CONSTRAINT [Sposob-Scheme] FOREIGN KEY ([Sposob_obraz], [¹]) REFERENCES [Sposob] ([Sposob_obraz], [¹]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




>>>>>>> 62e9253178310c2725fca2b17277ab0e4566ad6a
