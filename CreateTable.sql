CREATE TABLE [finals](
	[Id] int,
	[Country_Region] varchar(200),
	[Country_Code] varchar(20),
	[Year] int,
	[Celular_Descrip] float,
	[Internet_Users] float,
	[NoInternet_Users] float,
	[Broadband_Subscription] float
);
GO

DROP TABLE [dbo].[finals];

SELECT TOP 5 * FROM [dbo].[finals];

SELECT COUNT(*) FROM [dbo].[finals]