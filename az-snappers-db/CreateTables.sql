/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

CREATE TABLE [dbo].[Image]
(
	[ImageId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [Name] VARCHAR(200) NOT NULL, 
    [PropertyId] NVARCHAR(20) NOT NULL,
    [Path] NVARCHAR(300) NULL
)

GO

CREATE TABLE [dbo].[UserProfile]
(
	[UserId] INT IDENTITY(1000000,1) NOT NULL PRIMARY KEY, 
    [Username] NVARCHAR(50) NOT NULL, 
    [Password] NVARCHAR(50) NOT NULL, 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [LastName] NVARCHAR(100) NOT NULL, 
    [MiddleName] NVARCHAR(50) NOT NULL, 
    [CreditScore] INT NOT NULL DEFAULT 700, 
    [AUM] INT NOT NULL DEFAULT 100000,
    [RelationshipAge] INT NOT NULL,
    [Phone] NVARCHAR(15) NOT NULL,
    [Email] NVARCHAR(100) NOT NULL,
    [AccountNumber] NVARCHAR(20) NOT NULL
)

GO

CREATE TABLE [dbo].[Property]
(
	[PropertyId] INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [Address1] NVARCHAR(50) NOT NULL, 
    [Address2] NVARCHAR(50) NULL, 
    [City] NVARCHAR(50) NOT NULL, 
    [State] NVARCHAR(5) NOT NULL, 
    [Zip] NVARCHAR(10) NOT NULL, 
    [NeighborhoodId] INT NULL, 
    [Bedrooms] INT NULL, 
    [Bathrooms] INT NULL, 
    [Garage] INT NULL, 
    [Basement] INT NULL, 
    [Backyard] INT NULL, 
    [Status] NVARCHAR(50) NOT NULL DEFAULT 'Not For Sale',
    [Price] FLOAT NULL,
    [Size] FLOAT NOT NULL,
    [Tax] FLOAT NOT NULL
)

GO

CREATE TABLE [dbo].[Neighborhood]
(
	NeighborhoodId INT IDENTITY(1,1) NOT NULL PRIMARY KEY, 
    [OverallRanking] INT NOT NULL DEFAULT 5,
    [CrimeRanking] INT NOT NULL DEFAULT 5,
    [SchoolRanking] INT NOT NULL DEFAULT 5,
    [Population] INT NOT NULL DEFAULT 100000,
)

GO

CREATE TABLE [dbo].[HistoricalPrice]
(
	RecordId INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    PropertyId INT NOT NULL,
    [Price] FLOAT NULL,
    [DateOfSale] DATE NOT NULL
)

GO