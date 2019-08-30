USE [student]
GO

/****** Object:  Table [dbo].[DB_LOG]    Script Date: 08/28/2019 16:45:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DB_LOG](
	[DL_SQL] [nvarchar](4000) NULL,
	[DL_USER_ID] [nvarchar](12) NULL,
	[DL_IP] [nvarchar](50) NULL,
	[DL_TIME] [datetime] NULL
) ON [PRIMARY]

GO


