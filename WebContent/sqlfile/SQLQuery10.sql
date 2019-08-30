USE [student]
GO

/****** Object:  Table [dbo].[Table4]    Script Date: 08/28/2019 16:46:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Table4](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[age] [int] NOT NULL,
	[name] [char](10) NOT NULL,
	[pwd] [char](10) NOT NULL,
	[addess] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Table4]  WITH CHECK ADD CHECK  (([age]>(0) AND [age]<(150)))
GO


