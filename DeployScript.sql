/******** DMA Schema Migration Deployment Script      Script Date: 4/5/2023 4:27:55 PM ********/

/****** Object:  Table [dbo].[finals]    Script Date: 4/5/2023 4:27:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[finals]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[finals](
	[Id] [int] NULL,
	[Country_Region] [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Country_Code] [varchar](20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Year] [int] NULL,
	[Celular_Descrip] [float] NULL,
	[Internet_Users] [float] NULL,
	[NoInternet_Users] [float] NULL,
	[Broadband_Subscription] [float] NULL
)
END
GO

